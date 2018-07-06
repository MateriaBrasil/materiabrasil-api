
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
| **commentable_type** | *string* | the type of object the comment is associated with<br/> **one of:**`"Material"` | `"Material"` |
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


## <a name="resource-material">Material</a>

Stability: `prototype`

A material is a raw material

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **average_price** | *string* | the average price of the material | `"example"` |
| **code** | *string* | the code of the material | `"example"` |
| **description** | *string* | the description of the material | `"example"` |
| **id** | *integer* | unique identifier of the material | `42` |
| **image_url** | *string* | a link to an image of the material | `"example"` |
| **manufacturing_location** | *string* | the city/state where the material is manufactured | `"example"` |
| **name** | *string* | the name of the material | `"example"` |
| **properties** | *string* | the material's properties like type, shape and size | `"example"` |
| **sales_location** | *string* | the city/state where the material is sold | `"example"` |
| **supplier_contact** | *string* | the email of the material's supplier | `"example"` |
| **supplier_name** | *string* | the name of the materials' supplier | `"example"` |
| **technical_specification_url** | *string* | a link to the pdf file with the material's specifications | `"example"` |
| **usage** | *string* | how the material can be used | `"example"` |

### <a name="link-GET-material-/materials">Material List</a>

List materials.

```
GET /materials
```


#### Curl Example

```bash
$ curl -n https://api.materiabrasil.com/materials
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


## <a name="resource-user">User</a>

Stability: `prototype`

A user is a person registered in the platform

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **albums** | *array* | the albums that belong to the user |  |
| **email** | *email* | a link to an image of the user | `"username@example.com"` |
| **id** | *integer* | unique identifier of the user | `42` |
| **name** | *string* | the name of the user | `"example"` |

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


