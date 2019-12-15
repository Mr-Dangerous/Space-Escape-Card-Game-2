{
    "id": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "o_squad",
    "eventList": [
        {
            "id": "5cab440f-443b-4b80-800e-4105c86c3474",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b"
        },
        {
            "id": "54cf5834-b82c-4103-91d4-80cda0059911",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "8d76ac5c-c5ae-488c-9168-1544e89d8d6b"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
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
            "id": "74d7d18b-96f9-4c3d-ba0a-23f444ad3de8",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": ".217",
            "varName": "image_scale",
            "varType": 0
        },
        {
            "id": "6a9c155e-1106-40b4-8b60-9162d75ddc48",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "target_beacon",
            "varType": 0
        },
        {
            "id": "5a67aff6-4245-4d3d-825d-3e9212b22439",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "target_squad_resource",
            "varType": 5
        },
        {
            "id": "ff1b135e-c9b3-4444-bb8a-6edf5121b140",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "target_squad",
            "varType": 0
        },
        {
            "id": "03a0ea31-cdde-43ae-ac7a-740733e5ae7b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "60ce4eb1-9a4e-4898-b0bf-12188b305c40",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.1",
            "varName": "turn_speed",
            "varType": 0
        },
        {
            "id": "3870bc9d-878a-4003-83fd-18505b3c95ca",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0.05",
            "varName": "acceleration_rate",
            "varType": 0
        },
        {
            "id": "b135e527-3f53-42fc-a5c0-1543df977e6d",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "moving",
            "varType": 3
        },
        {
            "id": "6516eef7-dad7-4d5a-af6d-c18929f01b89",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "engage_enemy",
            "varType": 3
        },
        {
            "id": "4ee3b3fb-afcb-4db5-8ecd-a157f3863692",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1000",
            "varName": "scout_timer",
            "varType": 1
        },
        {
            "id": "9e0f14ed-dee6-4adb-974f-8ce9f4477b73",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "instance_find(o_game_setup, 0)",
            "varName": "game_setup_controller",
            "varType": 4
        },
        {
            "id": "cef27d41-752c-45a6-8791-b7d6f5b1bd8c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "instance_find(o_travel_map, 0)",
            "varName": "sector_map",
            "varType": 4
        },
        {
            "id": "25e5a964-4c92-497c-83ab-1bfcf05ac980",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "15",
            "varName": "maximum_units",
            "varType": 1
        },
        {
            "id": "57bec3e7-2bef-4fbf-b636-240c19b8229e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "-1",
            "varName": "target_sector",
            "varType": 0
        },
        {
            "id": "5be7c800-3388-4809-9074-0d2884f2387e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "combat_switch",
            "varType": 3
        },
        {
            "id": "805a0699-766e-4a5a-841d-5e57283baee4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "10",
            "varName": "drones",
            "varType": 1
        },
        {
            "id": "950f1085-13cc-4f3a-aa46-048234cfd8d1",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "drone_release_counter",
            "varType": 0
        },
        {
            "id": "ec756a5d-f498-4285-95fe-652e134551de",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "20",
            "varName": "drone_release_rate",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}