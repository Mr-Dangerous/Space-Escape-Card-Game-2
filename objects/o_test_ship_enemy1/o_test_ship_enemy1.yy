{
    "id": "f02abf53-e404-4132-be80-9f7bd1b1dea4",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_test_ship_enemy1",
    "eventList": [
        {
            "id": "75e89326-532e-41d2-959e-994781f909d3",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "f02abf53-e404-4132-be80-9f7bd1b1dea4"
        },
        {
            "id": "f957347b-c2b4-4e52-a54c-228d8efd2080",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "f02abf53-e404-4132-be80-9f7bd1b1dea4"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "e736f8f1-adfa-4330-86c2-8d2613aa2a1b",
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
            "id": "0216290e-07b3-418d-9ff0-001ef3c33bc4",
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
            "id": "e2f4fbe0-ab7d-439c-9162-30fbd12cf8e8",
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
            "id": "33fa5f68-fb9c-4a1b-8d5d-d5bae98877c0",
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
            "id": "abe15aef-8465-48bc-a060-009910949960",
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
            "id": "600e6786-7e86-4bf0-94f2-4ffe8e1be715",
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
            "id": "56784294-cfd4-4cbf-99c5-6456dfa9e215",
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
            "id": "e24f0c63-0f77-4a2c-b224-1285e7618850",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "strafe",
            "varType": 3
        },
        {
            "id": "fd71aeae-bf95-47c4-af03-afa47741b979",
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
            "id": "0d855388-c780-4552-803f-f94691a2419e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "2.7",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "75d16f4f-0e17-468d-a3c1-f0ad91fbe92b",
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
            "id": "5d0917eb-434c-46fa-a7f5-326d42a1f099",
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
            "id": "2417bc9b-541a-4da4-9b1e-eb4ce835eabe",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "vector_sliding",
            "varType": 3
        },
        {
            "id": "9db3d608-fd0e-4674-92a1-aa9d359071c4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "40",
            "varName": "target_indicator",
            "varType": 1
        },
        {
            "id": "9c17c210-8921-48dc-8499-50044d0267e3",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "-1",
            "varName": "strafe_direction",
            "varType": 1
        },
        {
            "id": "1bf45454-d50d-4e92-b06b-d69896b8bedf",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "combat_manuever_counter",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "5612b391-f707-4fa0-b352-b650456ef64d",
    "visible": true
}