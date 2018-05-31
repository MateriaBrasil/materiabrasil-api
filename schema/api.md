
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
| **name** | *string* | the name of the material | `"example"` |

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


