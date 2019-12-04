{
    "id": "fd65721c-c231-4056-84b1-f284b56d1bc6",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_test_ship",
    "eventList": [
        {
            "id": "753df027-ac64-4a4e-b0f8-74e8b13bd3ea",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "fd65721c-c231-4056-84b1-f284b56d1bc6"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "3fb9a899-8ab8-4f5f-90be-6b6166d77074",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "cf2e20e2-9c8d-4201-8284-9eff1e7a2cbe",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "seek",
            "varType": 3
        },
        {
            "id": "13989a52-9b38-4d3f-8103-f439bf2fe5dc",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "flee",
            "varType": 3
        },
        {
            "id": "5554a62a-984a-4d35-8add-24e32399cfbc",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "pursue",
            "varType": 3
        },
        {
            "id": "39cfad0d-8592-4ebf-b278-0e901ec59ae8",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "evade",
            "varType": 3
        },
        {
            "id": "82af1c55-52b2-4112-8fa8-2ca3e5a7b0a2",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "follow",
            "varType": 3
        },
        {
            "id": "238db250-8219-4dff-93a5-9eca1273ff93",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "joust",
            "varType": 3
        },
        {
            "id": "162e1a49-9cb5-4e90-98d1-e1efc925e119",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "ship_target",
            "varType": 0
        },
        {
            "id": "c3a9eb6c-4609-4632-93e5-7a0f15b4f1a9",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "dc715831-0eaf-4b86-bc02-6d4f287307e9",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3",
            "varName": "turn_speed",
            "varType": 0
        },
        {
            "id": "12dfc0eb-5117-4706-9dcd-c3affe32ca7f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.3",
            "varName": "acceleration_rate",
            "varType": 0
        },
        {
            "id": "e43922a1-c925-4881-981f-7c237bf0dc0c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "False",
            "varName": "vector_sliding",
            "varType": 3
        },
        {
            "id": "18a78a6a-fd6a-4ecf-8175-eb4cbc0ed6ca",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_x",
            "varType": 1
        },
        {
            "id": "e8e5649d-aa4f-4062-b13c-526dceb7f853",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_y",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "3b2d02f0-0456-417e-a0d0-929e418fc653",
    "visible": true
}