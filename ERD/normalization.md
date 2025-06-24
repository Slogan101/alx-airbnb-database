

## First Normal Form (1NF)

**Definition:**  
All tables have atomic values and no repeating groups.

**Status:**  
All columns in the schema contain atomic values (e.g., `email`, `pricepernight`, `rating`). There are no multi-valued or repeating columns.  
→ **Passed**

---

## Second Normal Form (2NF)

**Definition:**  
The table is in 1NF and all non-key attributes are fully functionally dependent on the entire primary key.

**Status:**  
- All tables have a **single-column primary key (UUID)**.
- No partial dependency exists, since there are no composite keys.
→ **Passed**

---

## Third Normal Form (3NF)

**Definition:**  
The table is in 2NF and there are no **transitive dependencies** (i.e., non-key attributes should not depend on other non-key attributes).

---

### 🔍 Review by Table

#### `users`
- No transitive dependencies
- All attributes depend on `id`

**3NF Compliant**

---

#### `property`
- `host_id` is a foreign key to `users.id`
- All other attributes describe the property only

**3NF Compliant**

---

#### `booking`
- `user_id` and `property_id` are foreign keys
- `total_price` may be **derived** from `pricepernight × number of nights`, but keeping it for performance is acceptable
- No non-key attribute depends on another non-key attribute

**3NF Compliant**

---

#### `payment`
- `booking_id` is the only foreign key
- No transitive dependencies

**3NF Compliant**

---

#### `review`
- All attributes relate directly to the review and link back to a user and a property

**3NF Compliant**

---

#### `message`
- All attributes directly relate to the message between two users

**3NF Compliant**

---

## 🧹 Summary of Adjustments

No major changes were needed. Schema design adheres to 3NF:

- Atomic values (1NF): 
- Full functional dependency (2NF):  
- No transitive dependency (3NF): 

No redundancies or normalization violations were found.



