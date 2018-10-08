
## <a name="resource-address">Address</a>

Stability: `prototype`

An address is a place associated with a supplier

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **address_type** | *string* | the type the address<br/> **one of:**`"manufacture"` or `"postal"` | `"manufacture"` |
| **city** | *string* | the city of the address | `"example"` |
| **country** | *string* | the country of the address | `"example"` |
| **id** | *integer* | unique identifier of the address | `42` |
| **phone_number** | *nullable string* | the phone number of the address | `null` |
| **state** | *string* | the state of the address | `"example"` |
| **street_address** | *string* | the street address of the address | `"example"` |
| **supplier_id** | *integer* | the id of the supplier of the address | `42` |
| **zip_code** | *nullable string* | the zip code of the address | `null` |

### <a name="link-POST-address-/addresses">Address Create</a>

Create a new address.

```
POST /addresses
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **address_type** | *string* | the type the address<br/> **one of:**`"manufacture"` or `"postal"` | `"manufacture"` |
| **city** | *string* | the city of the address | `"example"` |
| **country** | *string* | the country of the address | `"example"` |
| **state** | *string* | the state of the address | `"example"` |
| **street_address** | *string* | the street address of the address | `"example"` |
| **supplier_id** | *integer* | the id of the supplier of the address | `42` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **phone_number** | *nullable string* | the phone number of the address | `null` |
| **zip_code** | *nullable string* | the zip code of the address | `null` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/addresses \
  -d '{
  "supplier_id": 42,
  "address_type": "manufacture",
  "street_address": "example",
  "city": "example",
  "state": "example",
  "country": "example",
  "zip_code": "example",
  "phone_number": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```


## <a name="resource-album">Album</a>

Stability: `prototype`

An album is a collection of favorites

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **default** | *boolean* | indicates if this album is the user's default one | `true` |
| **id** | *integer* | unique identifier of the album | `42` |
| **name** | *string* | the name of the album | `"example"` |
| **user_id** | *integer* | the unique identifier of the user the album belongs to | `42` |

### <a name="link-GET-album-/albums/{(%23%2Fdefinitions%2Falbum%2Fdefinitions%2Fidentity)}/favorites">Album List comments</a>

List favorites on the album.

```
GET /albums/{album_id}/favorites
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/albums/$ALBUM_ID/favorites
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-comment">Comment</a>

Stability: `prototype`

A comment is created by a user at a material, product or service

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when the comment was created | `"2015-01-01T12:00:00Z"` |
| **id** | *integer* | unique identifier of the comment | `42` |
| **text** | *string* | the text of the comment | `"example"` |
| **user** | *object* | the author of the comment |  |

### <a name="link-POST-comment-/comments">Comment Create</a>

Create a new comment.

```
POST /comments
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **commentable_id** | *integer* | the id of the material, product of service the comment is associated with | `42` |
| **commentable_type** | *string* | the type of object the comment is associated with<br/> **one of:**`"Material"` or `"Topic"` | `"Material"` |
| **text** | *string* | the text of the comment | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/comments \
  -d '{
  "commentable_id": 42,
  "commentable_type": "Material",
  "text": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```


## <a name="resource-error">Error</a>

Stability: `prototype`

An error represents a failed action in the API

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *string* | unique identifier of error<br/> **pattern:** `^\w+$` | `"example"` |
| **message** | *string* | message of error | `"example"` |

### <a name="link-GET-error-/errors/{(%23%2Fdefinitions%2Ferror%2Fdefinitions%2Fidentity)}">Error Info</a>

Info for existing error.

```
GET /errors/{error_id}
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/errors/$ERROR_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "example",
  "message": "example"
}
```


## <a name="resource-favorite">Favorite</a>

Stability: `prototype`

A favorite is a material, product or service bookmarked by a user

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **album_id** | *integer* | the unique identifier of the album the favorite belongs to | `42` |
| **favoritable** | *object* | the object the favorite is associated with |  |
| **favoritable_id** | *integer* | the id of the material, product of service the favorite is associated with | `42` |
| **favoritable_type** | *string* | the type of object the favorite is associated with<br/> **one of:**`"Material"` | `"Material"` |
| **id** | *integer* | unique identifier of the favorite | `42` |

### <a name="link-POST-favorite-/favorites">Favorite Create</a>

Create a new favorite.

```
POST /favorites
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **album_id** | *integer* | unique identifier of the album | `42` |
| **favoritable_id** | *integer* | the id of the material, product of service the favorite is associated with | `42` |
| **favoritable_type** | *string* | the type of object the favorite is associated with<br/> **one of:**`"Material"` | `"Material"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/favorites \
  -d '{
  "album_id": 42,
  "favoritable_id": 42,
  "favoritable_type": "Material"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-DELETE-favorite-/favorites/{(%23%2Fdefinitions%2Ffavorite%2Fdefinitions%2Fidentity)}">Favorite Destroy</a>

Destroy an existing favorite.

```
DELETE /favorites/{favorite_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://api.materiabrasil.com/favorites/$FAVORITE_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-material">Material</a>

Stability: `prototype`

A material is a raw material

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **availability** | *nullable string* | the states and/or countries where the material is available for purchase | `null` |
| **average_price** | *string* | the average price of the material | `"example"` |
| **average_rating** | *nullable number* | the average rating of the reviews of the material | `null` |
| **certifications** | *nullable string* | the certifications of the material | `null` |
| **certifications_url** | *nullable string* | a link to the file with the material's certifications | `null` |
| **code** | *string* | the code of the material | `"example"` |
| **cover_image_url** | *nullable string* | a link to the optional cover image of the material | `null` |
| **density** | *nullable string* | the density of the material | `null` |
| **description** | *string* | the description of the material | `"example"` |
| **dimensions** | *nullable string* | the dimensions of the material | `null` |
| **first_driver** | *nullable number* | the first driver of the material | `null` |
| **fourth_driver** | *nullable number* | the fourth driver of the material | `null` |
| **highlight_image_url** | *nullable string* | a link to the optional highlight image of the material | `null` |
| **highlighted** | *boolean* | indicates if the material should be highlighted on the list | `true` |
| **id** | *integer* | unique identifier of the material | `42` |
| **image_url** | *nullable string* | a link to the default image of the material | `null` |
| **list_image_url** | *nullable string* | a link to the optional list image of the material | `null` |
| **maximum_purchase_quantity** | *nullable integer* | the maximum amount needed to order the material | `null` |
| **minimum_purchase_quantity** | *nullable integer* | the minimum amount needed to order the material | `null` |
| **name** | *string* | the name of the material | `"example"` |
| **ncm_code** | *nullable string* | classification code of the material according to ncm | `null` |
| **prizes** | *nullable string* | the prizes of the material | `null` |
| **second_driver** | *nullable number* | the second driver of the material | `null` |
| **sh_code** | *nullable string* | classification code of the material according to sh | `null` |
| **supplier_id** | *integer* | the unique identifier of the supplier the material belongs to | `42` |
| **supplier_name** | *string* | the name of the supplier the material belongs to | `"example"` |
| **technical_specification_url** | *nullable string* | a link to the pdf file with the material's specifications | `null` |
| **third_driver** | *nullable number* | the third driver of the material | `null` |
| **unit_of_sale** | *nullable string* | indicates the quantity/scale in which the material is sold | `null` |

### <a name="link-GET-material-/materials">Material List</a>

List materials.

```
GET /materials
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **categories** | *nullable array* | ids of categories to filter list | `null` |
| **categories** | *nullable array* | ids of categories to filter list | `null` |


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials
 -G \
  -d categories[]=
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-material-/materials/{(%23%2Fdefinitions%2Fmaterial%2Fdefinitions%2Fidentity)}">Material Info</a>

Info for existing material.

```
GET /materials/{material_id}
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials/$MATERIAL_ID
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-POST-material-/materials">Material Create</a>

Create a new material.

```
POST /materials
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **availability** | *nullable string* | the states and/or countries where the material is available for purchase | `null` |
| **average_price** | *string* | the average price of the material | `"example"` |
| **certifications** | *nullable string* | the certifications of the material | `null` |
| **certifications_url** | *nullable string* | a link to the file with the material's certifications | `null` |
| **code** | *string* | the code of the material | `"example"` |
| **density** | *nullable string* | the density of the material | `null` |
| **description** | *string* | the description of the material | `"example"` |
| **dimensions** | *nullable string* | the dimensions of the material | `null` |
| **maximum_purchase_quantity** | *nullable integer* | the maximum amount needed to order the material | `null` |
| **minimum_purchase_quantity** | *nullable integer* | the minimum amount needed to order the material | `null` |
| **name** | *string* | the name of the material | `"example"` |
| **ncm_code** | *nullable string* | classification code of the material according to ncm | `null` |
| **prizes** | *nullable string* | the prizes of the material | `null` |
| **sh_code** | *nullable string* | classification code of the material according to sh | `null` |
| **supplier_id** | *integer* | the unique identifier of the supplier the material belongs to | `42` |
| **unit_of_sale** | *nullable string* | indicates the quantity/scale in which the material is sold | `null` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/materials \
  -d '{
  "supplier_id": 42,
  "name": "example",
  "description": "example",
  "code": "example",
  "average_price": "example",
  "unit_of_sale": "example",
  "minimum_purchase_quantity": 42,
  "maximum_purchase_quantity": 42,
  "ncm_code": "example",
  "sh_code": "example",
  "certifications": "example",
  "certifications_url": "example",
  "prizes": "example",
  "density": "example",
  "dimensions": "example",
  "availability": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-PUT-material-/materials/{(%23%2Fdefinitions%2Fsupplier%2Fdefinitions%2Fidentity)}">Material Update</a>

Update a material.

```
PUT /materials/{supplier_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **availability** | *nullable string* | the states and/or countries where the material is available for purchase | `null` |
| **average_price** | *string* | the average price of the material | `"example"` |
| **average_rating** | *nullable number* | the average rating of the reviews of the material | `null` |
| **certifications** | *nullable string* | the certifications of the material | `null` |
| **certifications_url** | *nullable string* | a link to the file with the material's certifications | `null` |
| **code** | *string* | the code of the material | `"example"` |
| **cover_image_url** | *nullable string* | a link to the optional cover image of the material | `null` |
| **density** | *nullable string* | the density of the material | `null` |
| **description** | *string* | the description of the material | `"example"` |
| **dimensions** | *nullable string* | the dimensions of the material | `null` |
| **highlight_image_url** | *nullable string* | a link to the optional highlight image of the material | `null` |
| **image_url** | *nullable string* | a link to the default image of the material | `null` |
| **list_image_url** | *nullable string* | a link to the optional list image of the material | `null` |
| **maximum_purchase_quantity** | *nullable integer* | the maximum amount needed to order the material | `null` |
| **minimum_purchase_quantity** | *nullable integer* | the minimum amount needed to order the material | `null` |
| **name** | *string* | the name of the material | `"example"` |
| **ncm_code** | *nullable string* | classification code of the material according to ncm | `null` |
| **prizes** | *nullable string* | the prizes of the material | `null` |
| **sh_code** | *nullable string* | classification code of the material according to sh | `null` |
| **technical_specification_url** | *nullable string* | a link to the pdf file with the material's specifications | `null` |
| **unit_of_sale** | *nullable string* | indicates the quantity/scale in which the material is sold | `null` |


#### Curl Example

```bash
$ curl -n -X PUT https://api.materiabrasil.com/materials/$SUPPLIER_ID \
  -d '{
  "name": "example",
  "image_url": "example",
  "cover_image_url": "example",
  "highlight_image_url": "example",
  "list_image_url": "example",
  "description": "example",
  "code": "example",
  "average_price": "example",
  "technical_specification_url": "example",
  "average_rating": 42.0,
  "unit_of_sale": "example",
  "minimum_purchase_quantity": 42,
  "maximum_purchase_quantity": 42,
  "ncm_code": "example",
  "sh_code": "example",
  "certifications": "example",
  "certifications_url": "example",
  "prizes": "example",
  "density": "example",
  "dimensions": "example",
  "availability": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-material-/materials/{(%23%2Fdefinitions%2Fmaterial%2Fdefinitions%2Fidentity)}/comments">Material List comments</a>

List comments on the material.

```
GET /materials/{material_id}/comments
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials/$MATERIAL_ID/comments
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-material-/materials/{(%23%2Fdefinitions%2Fmaterial%2Fdefinitions%2Fidentity)}/reviews">Material List reviews</a>

List reviews on the material.

```
GET /materials/{material_id}/reviews
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials/$MATERIAL_ID/reviews
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-material-/materials/{(%23%2Fdefinitions%2Fmaterial%2Fdefinitions%2Fidentity)}/categories">Material List categories</a>

List material's categories

```
GET /materials/{material_id}/categories
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials/$MATERIAL_ID/categories
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-material_category">MaterialCategory</a>

Stability: `prototype`

An association between a material and a category

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **category_id** | *integer* | the unique identifier of the category to be associated | `42` |
| **id** | *integer* | unique identifier of the association | `42` |
| **material_id** | *integer* | the unique identifier of the material to be associated | `42` |

### <a name="link-POST-material_category-/material_categories">MaterialCategory Create</a>

Create a new association between a material and a category

```
POST /material_categories
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **category_id** | *integer* | the unique identifier of the category to be associated | `42` |
| **material_id** | *integer* | the unique identifier of the material to be associated | `42` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/material_categories \
  -d '{
  "category_id": 42,
  "material_id": 42
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-DELETE-material_category-/material_categories/{(%23%2Fdefinitions%2Fmaterial_category%2Fdefinitions%2Fidentity)}">MaterialCategory Destroy</a>

Destroy an association between a material and a category

```
DELETE /material_categories/{material_category_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://api.materiabrasil.com/material_categories/$MATERIAL_CATEGORY_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-message">Message</a>

Stability: `prototype`

A message is a communication from a user to a supplier

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when the message was created | `"2015-01-01T12:00:00Z"` |
| **from** | *object* | the author of the message |  |
| **id** | *integer* | unique identifier of the message | `42` |
| **text** | *string* | the text of the message | `"example"` |
| **to** | *object* | the recipient of the message |  |

### <a name="link-POST-message-/messages">Message Create</a>

Create a new message.

```
POST /messages
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **text** | *string* | the text of the message | `"example"` |
| **to_id** | *integer* | the id of the supplier to which the message is sent | `42` |
| **to_type** | *string* | the type of object to which the message is sent<br/> **one of:**`"Supplier"` or `"User"` | `"Supplier"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/messages \
  -d '{
  "to_id": 42,
  "to_type": "Supplier",
  "text": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```


## <a name="resource-review">Review</a>

Stability: `prototype`

A review is created by a user at a material, product or service

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when the review was created | `"2015-01-01T12:00:00Z"` |
| **id** | *integer* | unique identifier of the review | `42` |
| **rating** | *integer* | the rating of the review<br/> **Range:** `1 <= value <= 5` | `42` |
| **text** | *string* | the text of the review | `"example"` |
| **user** | *object* | the author of the review |  |

### <a name="link-POST-review-/reviews">Review Create</a>

Create a new review.

```
POST /reviews
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **rating** | *integer* | the rating of the review<br/> **Range:** `1 <= value <= 5` | `42` |
| **reviewable_id** | *integer* | the id of the material, product of service the review is associated with | `42` |
| **reviewable_type** | *string* | the type of object the review is associated with<br/> **one of:**`"Material"` | `"Material"` |
| **text** | *string* | the text of the review | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/reviews \
  -d '{
  "reviewable_id": 42,
  "reviewable_type": "Material",
  "text": "example",
  "rating": 42
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```


## <a name="resource-search">Search</a>

Stability: `prototype`

A search represents objects returned from the user's query term

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **term** | *string* | the term being searched for | `"example"` |

### <a name="link-GET-search-/search">Search Search</a>

Search for content.

```
GET /search
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **categories** | *nullable array* | ids of categories to filter list | `null` |
| **categories** | *nullable array* | ids of categories to filter list | `null` |
| **term** | *string* | the term being searched for | `"example"` |


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/search
 -G \
  -d term=example \
  -d categories[]=
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-supplier">Supplier</a>

Stability: `prototype`

A supplier is a company that offers materials, products or services

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cnpj** | *string* | the cnpj of the supplier | `"example"` |
| **company_name** | *string* | the legal name of the supplier | `"example"` |
| **company_revenue** | *nullable string* | the yearly revenue of the company | `null` |
| **description** | *string* | the description of the supplier | `"example"` |
| **email** | *email* | the email of the supplier | `"username@example.com"` |
| **id** | *integer* | unique identifier of the supplier | `42` |
| **image_url** | *nullable string* | a link to the profile image of the supplier | `null` |
| **materials** | *array* | the materials that belong to the supplier |  |
| **municipal_subscription** | *string* | the city subscription of the supplier | `"example"` |
| **name** | *string* | the name of the supplier | `"example"` |
| **number_of_employees** | *nullable integer* | the number of employees of the supplier | `null` |
| **phone** | *string* | the phone of the supplier | `"example"` |
| **reach** | *string* | the reach of the supplier<br/> **one of:**`"city"` or `"state"` or `"country"` or `"continent"` or `"global"` | `"city"` |
| **state_subscription** | *string* | the state subscription of the supplier | `"example"` |
| **user_id** | *integer* | the unique identifier of the user the supplier belongs to | `42` |
| **website** | *string* | the website of the supplier | `"example"` |

### <a name="link-GET-supplier-/suppliers/{(%23%2Fdefinitions%2Fsupplier%2Fdefinitions%2Fidentity)}">Supplier Info</a>

Info for existing supplier.

```
GET /suppliers/{supplier_id}
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/suppliers/$SUPPLIER_ID
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-POST-supplier-/suppliers">Supplier Create</a>

Create a new supplier.

```
POST /suppliers
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cnpj** | *string* | the cnpj of the supplier | `"example"` |
| **company_name** | *string* | the legal name of the supplier | `"example"` |
| **company_revenue** | *nullable string* | the yearly revenue of the company | `null` |
| **description** | *string* | the description of the supplier | `"example"` |
| **email** | *email* | the email of the supplier | `"username@example.com"` |
| **municipal_subscription** | *string* | the city subscription of the supplier | `"example"` |
| **name** | *string* | the name of the supplier | `"example"` |
| **number_of_employees** | *nullable integer* | the number of employees of the supplier | `null` |
| **phone** | *string* | the phone of the supplier | `"example"` |
| **reach** | *string* | the reach of the supplier<br/> **one of:**`"city"` or `"state"` or `"country"` or `"continent"` or `"global"` | `"city"` |
| **state_subscription** | *string* | the state subscription of the supplier | `"example"` |
| **website** | *string* | the website of the supplier | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/suppliers \
  -d '{
  "name": "example",
  "description": "example",
  "website": "example",
  "email": "username@example.com",
  "cnpj": "example",
  "company_name": "example",
  "municipal_subscription": "example",
  "state_subscription": "example",
  "phone": "example",
  "company_revenue": "example",
  "number_of_employees": 42,
  "reach": "city"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-PUT-supplier-/suppliers/{(%23%2Fdefinitions%2Fsupplier%2Fdefinitions%2Fidentity)}">Supplier Update</a>

Update a supplier.

```
PUT /suppliers/{supplier_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cnpj** | *string* | the cnpj of the supplier | `"example"` |
| **company_name** | *string* | the legal name of the supplier | `"example"` |
| **company_revenue** | *nullable string* | the yearly revenue of the company | `null` |
| **description** | *string* | the description of the supplier | `"example"` |
| **email** | *email* | the email of the supplier | `"username@example.com"` |
| **image_url** | *nullable string* | a link to the profile image of the supplier | `null` |
| **municipal_subscription** | *string* | the city subscription of the supplier | `"example"` |
| **name** | *string* | the name of the supplier | `"example"` |
| **number_of_employees** | *nullable integer* | the number of employees of the supplier | `null` |
| **phone** | *string* | the phone of the supplier | `"example"` |
| **reach** | *string* | the reach of the supplier<br/> **one of:**`"city"` or `"state"` or `"country"` or `"continent"` or `"global"` | `"city"` |
| **state_subscription** | *string* | the state subscription of the supplier | `"example"` |
| **website** | *string* | the website of the supplier | `"example"` |


#### Curl Example

```bash
$ curl -n -X PUT https://api.materiabrasil.com/suppliers/$SUPPLIER_ID \
  -d '{
  "name": "example",
  "description": "example",
  "website": "example",
  "email": "username@example.com",
  "cnpj": "example",
  "company_name": "example",
  "municipal_subscription": "example",
  "state_subscription": "example",
  "phone": "example",
  "company_revenue": "example",
  "number_of_employees": 42,
  "reach": "city",
  "image_url": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-supplier-/suppliers/{(%23%2Fdefinitions%2Fmaterial%2Fdefinitions%2Fidentity)}/addresses">Supplier List addresses</a>

List addresses on the supplier.

```
GET /suppliers/{material_id}/addresses
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/suppliers/$MATERIAL_ID/addresses
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-topic">Topic</a>

Stability: `prototype`

A topic is created by a user to start a conversation

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when the topic was created | `"2015-01-01T12:00:00Z"` |
| **id** | *integer* | unique identifier of the topic | `42` |
| **subject** | *string* | the subject of the topic | `"example"` |
| **text** | *string* | the text of the topic | `"example"` |
| **updated_at** | *date-time* | when the topic was updated | `"2015-01-01T12:00:00Z"` |
| **user** | *object* | the author of the topic |  |

### <a name="link-GET-topic-/topics">Topic List</a>

List topics.

```
GET /topics
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/topics
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-topic-/topics/{(%23%2Fdefinitions%2Ftopic%2Fdefinitions%2Fidentity)}">Topic Info</a>

Info for existing topic.

```
GET /topics/{topic_id}
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/topics/$TOPIC_ID
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-POST-topic-/topics">Topic Create</a>

Create a new topic.

```
POST /topics
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **subject** | *string* | the subject of the topic | `"example"` |
| **text** | *string* | the text of the topic | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://api.materiabrasil.com/topics \
  -d '{
  "subject": "example",
  "text": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
null
```

### <a name="link-GET-topic-/topics/{(%23%2Fdefinitions%2Ftopic%2Fdefinitions%2Fidentity)}/comments">Topic List comments</a>

List comments on the topic.

```
GET /topics/{topic_id}/comments
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/topics/$TOPIC_ID/comments
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


## <a name="resource-user">User</a>

Stability: `prototype`

A user is a person registered in the platform

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **albums** | *array* | the albums that belong to the user |  |
| **bio** | *nullable string* | a short biography of the user | `null` |
| **city** | *nullable string* | the city of the user | `null` |
| **company** | *nullable string* | the company where the user works | `null` |
| **country** | *nullable string* | the country of the user | `null` |
| **email** | *email* | the email of the user | `"username@example.com"` |
| **first_name** | *string* | the first name of the user | `"example"` |
| **id** | *integer* | unique identifier of the user | `42` |
| **image_url** | *nullable string* | a link to the profile image of the user | `null` |
| **last_name** | *string* | the last name of the user | `"example"` |
| **public_profile** | *boolean* | indicates if the user profile is public | `true` |
| **state** | *nullable string* | the state of the user | `null` |
| **suppliers** | *array* | the suppliers that belong to the user |  |
| **website** | *nullable uri* | the website of the user | `null` |
| **work_title** | *nullable string* | the work title of the user | `null` |

### <a name="link-GET-user-/users/{(%23%2Fdefinitions%2Fuser%2Fdefinitions%2Fidentity)}">User Info</a>

Info for existing user.

```
GET /users/{user_id}
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/users/$USER_ID
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-PUT-user-/users/{(%23%2Fdefinitions%2Fuser%2Fdefinitions%2Fidentity)}">User Update</a>

Update existing user.

```
PUT /users/{user_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **bio** | *nullable string* | a short biography of the user | `null` |
| **city** | *nullable string* | the city of the user | `null` |
| **company** | *nullable string* | the company where the user works | `null` |
| **country** | *nullable string* | the country of the user | `null` |
| **first_name** | *string* | the first name of the user | `"example"` |
| **image_url** | *nullable string* | a link to the profile image of the user | `null` |
| **last_name** | *string* | the last name of the user | `"example"` |
| **state** | *nullable string* | the state of the user | `null` |
| **website** | *nullable uri* | the website of the user | `null` |
| **work_title** | *nullable string* | the work title of the user | `null` |


#### Curl Example

```bash
$ curl -n -X PUT https://api.materiabrasil.com/users/$USER_ID \
  -d '{
  "image_url": "example",
  "first_name": "example",
  "last_name": "example",
  "city": "example",
  "state": "example",
  "country": "example",
  "bio": "example",
  "company": "example",
  "work_title": "example",
  "website": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```


