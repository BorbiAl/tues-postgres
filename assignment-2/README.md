# Assignment 2 – Group Food Order

## Decisions I made and why

I have four tables: `students`, `menu_items`, `orders` (one row per group order, with its date and place) and `order_items`, which connects them and says who ordered what and how many. Because one order has many people and one person can order many things, `order_items` is the link table. Its primary key is `(order_id, student_id, menu_item_id)`, so the same person can't get the same dish twice in one order. Ordering 2 pieces goes in `quantity`, not in a second row. I copy the price into `order_items.unit_price` when the order is made, because menu prices change: the Margherita was 9.50 in order 1 and is 10.20 now, and the old bill must not change. I deliberately do not store any totals or "amount owed" columns, because they can always be calculated from quantity × unit_price, and a stored total could get out of sync with the items.
