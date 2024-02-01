WITH source AS (
        SELECT *

        FROM {{ source('thelook_ecommerce', 'order_items') }}
)

SELECT
        id AS order_item_id,
        order_id,
        user_id,
        product_id,

		sale_price AS item_sale_price

		{# unused columns: inventory_item_id,

		For the below, we assume that all of these will be the same
		in stg_ecommerce__orders so we can use that as the source of truth
		(e.g. a whole order is returned, not just 1 item).
		This is a simplification for the purpose of this course.
		- gender
		- status
		- created_at
		- shipped_at
		- delivered_at
		- returned_at #}


FROM source