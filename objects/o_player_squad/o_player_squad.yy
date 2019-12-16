{
    "id": "690341ed-fe2b-4d57-8a1b-94cbc1f2a9ba",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_player_squad",
    "eventList": [
        {
            "id": "bbabcb56-da4c-4e86-925f-31f5f715f58d",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "690341ed-fe2b-4d57-8a1b-94cbc1f2a9ba"
        },
        {
            "id": "5c1f56fe-1529-49b4-b2a3-cca9ae620873",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "690341ed-fe2b-4d57-8a1b-94cbc1f2a9ba"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": [
        {
            "id": "9bdf1cd3-76d0-4987-bf69-34535360e404",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
            "propertyId": "74d7d18b-96f9-4c3d-ba0a-23f444ad3de8",
            "value": ".1521"
        },
        {
            "id": "3d1669c9-4397-481c-bf68-73ae9d52290a",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
            "propertyId": "5a67aff6-4245-4d3d-825d-3e9212b22439",
            "value": "o_enemy_squad"
        },
        {
            "id": "e7578706-1366-4a85-a332-104bf3ec9636",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
            "propertyId": "ec756a5d-f498-4285-95fe-652e134551de",
            "value": "60"
        },
        {
            "id": "fa6d8f18-318b-4797-be16-ac17db77e7e9",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
            "propertyId": "805a0699-766e-4a5a-841d-5e57283baee4",
            "value": "4"
        }
    ],
    "parentObjectId": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
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
            "id": "8470f706-a26d-44d3-820f-6a1141baf7a8",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "in_combat",
            "varType": 3
        },
        {
            "id": "803d6737-8940-4969-8230-9bca578b2c88",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "instance_find(o_card_game, 0)",
            "varName": "card_game_controller",
            "varType": 4
        },
        {
            "id": "e82802fc-489e-4ca0-ac42-fa4a8bdf6d8d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "360",
            "varName": "resource_gather_counter",
            "varType": 1
        }
    ],
    "solid": false,
    "spriteId": "f83ef7d8-19e1-4ebc-8b72-794245ac9af7",
    "visible": true
}