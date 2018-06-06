
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
| **manufacturing_location** | *string* | the city/state where the material is manufactured | `"example"` |
| **name** | *string* | the name of the material | `"example"` |
| **properties** | *string* | the material's properties like type, shape and size | `"example"` |
| **sales_location** | *string* | the city/state where the material is sold | `"example"` |
| **supplier_email** | *string* | the email of the material's supplier | `"example"` |
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


