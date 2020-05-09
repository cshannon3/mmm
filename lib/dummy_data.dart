var dummyCollections = {
  "resources": {
    "modelName": "Resource",
    "collectionName": "resources",
    "spreadsheetName": "Resource",
    "sheetBottomRow": 16,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "name": {"type": "String", "sheetColumn": 3},
      "type": {
        "fieldName": "type",
        "displayName": "type",
        "type": "String",
        "sheetColumn": 4
      },
      "isSite": {
        "fieldName": "isSite",
        "displayName": "isSite",
        "type": "bool",
        "sheetColumn": 5
      },
      "isDownload": {
        "fieldName": "isDownload",
        "displayName": "isDownload",
        "type": "bool",
        "sheetColumn": 6
      },
      "isImage": {
        "fieldName": "isDownload",
        "displayName": "isDownload",
        "type": "bool",
        "sheetColumn": 7
      },
      "url": {
        "fieldName": "url",
        "displayName": "url",
        "type": "String",
        "sheetColumn": 8
      },
      "description": {
        "fieldName": "description",
        "displayName": "description",
        "type": "String",
        "sheetColumn": 9
      },
      "show": {
        "fieldName": "show",
        "displayName": "show",
        "type": "bool",
        "sheetColumn": 10
      },
    },
    "models": {
      "id1": {
        "id": "id1",
        "name": "Prusa Design",
        "isSite": false,
        "isDownload": false,
        "isImage": true,
        "url":
            "https://media.prusaprinters.org/thumbs/cover/1200x630/media/prints/27950/images/279325_253e1b16-a093-49be-91fc-94f9d58f6cf5/3_pins.jpg",
        "description": "",
        "show": true
      },
      "id2": {
        "id": "id2",
        "isSite": true,
        "isDownload": false,
        "isImage": false,
        "url":
            "https://www.prusaprinters.org/prints/28504-slim-rc3-us-with-comfort-features-plus-shield",
        "description": "",
        "show": true
      },
      "id3": {
        "id": "id3",
        "isSite": false,
        "isDownload": true,
        "isImage": false,
        "url":
            "https://media.prusaprinters.org/media/prints/28504/stls/283479_de0889c1-5758-486b-801d-b8d4beef5b06/covid19_headband_rc3us_slim-nologo.stl#_ga=2.49263974.131473350.1586915350-468789971.1584729672",
        "description": "",
        "show": true
      },
      "id4": {
        "id": "id4",
        "isSite": false,
        "isDownload": false,
        "isImage": false,
        "url": "",
        "description": "",
        "show": true
      },
      "id5": {
        "id": "id5",
        "isSite": false,
        "isDownload": false,
        "isImage": false,
        "url": "",
        "description": "",
        "show": true
      },
      "id6": {
        "id": "id6",
        "name": "3DVerkstan Design",
        "isSite": false,
        "isDownload": false,
        "isImage": true,
        "url":
            "https://cdn.myminifactory.com/assets/object-assets/5e8d747938361/images/720X720-img-20200408-083219749.jpg",
        "description": "",
        "show": true
      },
    }
  },
  "orgs": {
    "modelName": "Org",
    "collectionName": "orgs",
    "spreadsheetName": "Org",
    "sheetBottomRow": 129,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "Name": {"type": "String", "sheetColumn": 3},
      "isActive": {"type": "bool", "sheetColumn": 4},
      "hasDeliveredTo": {"type": "bool", "sheetColumn": 5},
      "PlaceID": {"type": "String", "sheetColumn": 6},
      "Type": {"type": "String", "sheetColumn": 7},
      "Org phone": {"type": "String", "sheetColumn": 8},
      "Website": {"type": "String", "sheetColumn": 9},
      "Email": {"type": "String", "sheetColumn": 10},
      "Address": {"type": "String", "sheetColumn": 11},
      "Notes": {"type": "String", "sheetColumn": 12},
      "Needed Items": {"type": "String", "sheetColumn": 13},
      "RequestsList": {
        "type": "List-ForeignKey",
        "typeInfo": "requests",
        "sheetColumn": 14
      },
      "Drop Off": {"type": "String", "sheetColumn": 15},
      "Instructions": {"type": "String", "sheetColumn": 16},
      "Volunteer District": {"type": "String", "sheetColumn": 17},
      "City": {"type": "String", "sheetColumn": 18},
      "Contact Person": {"type": "String", "sheetColumn": 19},
      "Contact #": {"type": "String", "sheetColumn": 20},
      "Contact Email": {"type": "String", "sheetColumn": 21},
      "Contact By": {"type": "String", "sheetColumn": 22},
      "Contacted On": {"type": "String", "sheetColumn": 23},
      "Contacted Through": {"type": "String", "sheetColumn": 24},
      "Conversation Notes": {"type": "String", "sheetColumn": 25},
      "Delivery Times": {"type": "String", "sheetColumn": 26},
      "Delivery Address": {"type": "String", "sheetColumn": 27},
      "Lat": {"type": "double", "sheetColumn": 28},
      "Lng": {"type": "double", "sheetColumn": 29},
    },
    "models": {
      "chris": {
        "id": "chris",
        "Name": "Christiana Hospital",
        "isActive": true,
        "PlaceID": "ChIJCbcdfuEAx4kRLdxAZdCu6-Q",
        "Type": "Hospital",
        "Org phone": "(302) 733-1000",
        "Website": "https://christianacare.org/facilities/christianahospital/",
        "Address": "4755 Ogletown Stanton Rd, Newark, DE 19718, USA",
        "Lat": 39.6902474,
        "Lng": -75.6726298,
        "RequestsList": ["req1"]
      },
      "shipley": {
        "id": "shipley",
        "Name": "Shipley Manor",
        "isActive": true,
        "PlaceID": "ChIJCbcdfuEAx4kRLdxAZdCu6-Q",
        "Type": "Senior Living",
        "Org phone": "(302) 733-1000",
        "Address": "4755 Ogletown Stanton Rd, Newark, DE 19718, USA",
        "Lat": 39.7427944,
        "Lng": -75.5507282,
        "RequestsList": []
      }
    }
  },
  "designs": {
    "modelName": "Design",
    "collectionName": "designs",
    "spreadsheetName": "Design",
    "sheetBottomRow": 12,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "Name": {"type": "String", "sheetColumn": 2},
      "Description": {"type": "String", "sheetColumn": 3},
      "resources": {
        "type": "List-ForeignKey",
        "typeInfo": "resources",
        "sheetColumn": 4
      },
      "Target Population": {"type": "String", "sheetColumn": 5},
      "Open Requests": {"type": "int", "sheetColumn": 6},
      "Total Prints": {"type": "int", "sheetColumn": 7},
      "Approved": {"type": "bool", "sheetColumn": 8},
      "Verified": {"type": "bool", "sheetColumn": 9},
      "Offered": {"type": "bool", "sheetColumn": 10},
      "type": {"type": "String", "sheetColumn": 11},
      "subtype": {"type": "String", "sheetColumn": 12},
      "score": {"type": "String", "sheetColumn": 13},
    },
    "models": {
      "faceshield": {
        "id": "faceshield",
        "Name": "Face Shield",
        "resources": ["id1", "id2", "id3", "id6"],
        "Target Population": "Medical Facilities",
        "Open Requests": 100,
        "Total Prints": 300,
        "Approved": true,
        "Verified": true,
        "Offered": true,
        "type": "ppe",
        "subtype": "faceshield",
      },
      "earsaver": {
        "id": "earsaver",
        "Name": "Ear Saver",
        "resources": ["id1", "id2", "id3", "id6"],
        "Target Population": "All",
        "Open Requests": 500,
        "Total Prints": 300,
        "Approved": true,
        "Verified": true,
        "Offered": true,
        "type": "ppe",
        "subtype": "earsaver",
      }
    }
  },
  "requests": {
    "modelName": "Request",
    "collectionName": "requests",
    "spreadsheetName": "Request",
    "sheetBottomRow": 17,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "designID": {
        "type": "ForeignKey",
        "typeInfo": "designs",
        "sheetColumn": 3
      },
      "designName": {"type": "String", "sheetColumn": 4},
      "orgID": {"type": "ForeignKey", "typeInfo": "orgs", "sheetColumn": 5},
      "orgName": {"type": "String", "sheetColumn": 6},
      "userID": {"type": "ForeignKey", "typeInfo": "users", "sheetColumn": 7},
      "orgType": {"type": "String", "sheetColumn": 8},
      "requestSource": {"type": "String", "sheetColumn": 9},
      "name": {"type": "String", "sheetColumn": 10},
      "quantityRequested": {"type": "int", "sheetColumn": 11},
      "quantityRecieved": {"type": "int", "sheetColumn": 12},
      "remaining": {"type": "int", "sheetColumn": 13},
      "isDone": {"type": "bool", "sheetColumn": 14},
      "status": {"type": "String", "sheetColumn": 15},
      "claimsList": {
        "type": "List-ForeignKey",
        "typeInfo": "claims",
        "sheetColumn": 16
      },
    },
    "models": {
      "req1": {
        "id": "req1",
        "designID": "earsaver",
        "designName": "Ear Savers",
        "orgID": "chris",
        "orgName": "Christiana Hospital",
        "quantityRequested": 200,
        "quantityRecieved": 40,
        "claimsList": ["claim1", "claim2"]
      }
    }
  },
  "userupdates": {
    "modelName": "UserUpdate",
    "collectionName": "userupdates",
    "spreadsheetName": "UserUpdate",
    "sheetBottomRow": 8,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "userid": {"type": "ForeignKey", "typeInfo": "users", "sheetColumn": 3},
      "designID": {
        "type": "ForeignKey",
        "typeInfo": "designs",
        "sheetColumn": 4
      },
      "designName": {"type": "String", "sheetColumn": 5},
      "claimID": {"type": "ForeignKey", "typeInfo": "claims", "sheetColumn": 6},
      "quantity": {"type": "int", "sheetColumn": 7},
      "updateType": {"type": "int", "sheetColumn": 8},
      "title": {"type": "String", "sheetColumn": 9},
      "description": {"type": "String", "sheetColumn": 10},
      "photourl": {"type": "String", "sheetColumn": 11},
    },
    "models": {
      "update1": {
        "id": "update1",
        "userid": "Tkz01qVV6Zbn8PXCJMVibjihuA23",
        "designID": "earsaver",
        "claimID": "claim1",
        "quantity": 40,
        "photourl":
            "https://firebasestorage.googleapis.com/v0/b/twitter-clone3.appspot.com/o/images%2Fshipley_manor_delivery.jpg?alt=media&token=2ae36d88-327a-4451-add2-4ae94cccf101",
      },
      "update2": {
        "id": "update2",
        "userid": "Tkz01qVV6Zbn8PXCJMVibjihuA23",
        "designID": "faceshield",
        "quantity": 60,
        "photourl":
            "https://firebasestorage.googleapis.com/v0/b/twitter-clone3.appspot.com/o/images%2Fdrop_off_042020_1.jpg?alt=media&token=275004c8-b7a0-4b61-a4da-1de500c25f93",
      }
    }
  },
  "claims": {
    "modelName": "Claim",
    "collectionName": "claims",
    "spreadsheetName": "Claim",
    "sheetBottomRow": 8,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "orgID": {"type": "ForeignKey", "typeInfo": "orgs", "sheetColumn": 3},
      "requestID": {
        "type": "ForeignKey",
        "typeInfo": "requests",
        "sheetColumn": 4
      },
      "designID": {
        "type": "ForeignKey",
        "typeInfo": "designs",
        "sheetColumn": 5
      },
      "userID": {"type": "ForeignKey", "typeInfo": "users", "sheetColumn": 6},
      "updateID": {
        "type": "ForeignKey",
        "typeInfo": "userupdates",
        "sheetColumn": 7
      },
      "org name": {"type": "String", "sheetColumn": 8},
      "user name": {"type": "String", "sheetColumn": 9},
      "user email": {"type": "String", "sheetColumn": 10},
      "status": {"type": "String", "sheetColumn": 11},
      "isCompleted": {"type": "bool", "sheetColumn": 11},
      "description": {"type": "String", "sheetColumn": 12},
      "quantity": {"type": "int", "sheetColumn": 13},
      "createdDate": {"type": "DateTime", "sheetColumn": 14},
      "expirationDate": {"type": "DateTime", "sheetColumn": 15},
      "completionDate": {"type": "DateTime", "sheetColumn": 16},
    },
    "models": {
      "claim1": {
        "id": "claim1",
        "orgID": "chris",
        "requestID": "request1",
        "designID": "earsaver",
        "userID": "Tkz01qVV6Zbn8PXCJMVibjihuA23",
        "updateID": "update1",
        "isCompleted": false,
        "description": "Will get done today",
        "quantity": 40,
      },
      "claim2": {
        "id": "claim2",
        "orgID": "chris",
        "requestID": "request1",
        "designID": "earsaver",
        "userID": "Tkz01qVV6Zbn8PXCJMVibjihuA23",
        "isCompleted": false,
        "description": "Will get done by tomorrow",
        "quantity": 100,
      }
    }
  },
  "groups": {
    "modelName": "Group",
    "collectionName": "groups",
    "spreadsheetName": "Group",
    "sheetBottomRow": 8,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "userID": {"type": "ForeignKey", "typeInfo": "users", "sheetColumn": 3},
      "contactPerson": {"type": "String", "sheetColumn": 4},
      "name": {"type": "String", "sheetColumn": 5},
      "type": {"type": "String", "sheetColumn": 6},
      "description": {"type": "String", "sheetColumn": 7},
      "updates": {
        "type": "List-ForeignKey",
        "typeInfo": "userupdates",
        "sheetColumn": 8
      },
      "numMembers": {"type": "int", "sheetColumn": 9},
      "userList": {
        "type": "List-ForeignKey",
        "typeInfo": "users",
        "sheetColumn": 10
      },
      "targetPopulation": {"type": "String", "sheetColumn": 11},
      "resources": {
        "type": "List-ForeignKey",
        "typeInfo": "resources",
        "sheetColumn": 12
      },
      "approvedDesigns": {
        "type": "List-ForeignKey",
        "typeInfo": "designs",
        "sheetColumn": 13
      },
      "isVerified": {"type": "bool", "sheetColumn": 14},
    },
    "models": {}
  },
  "hubs": {
    "modelName": "Hub",
    "collectionName": "hubs",
    "spreadsheetName": "Hub",
    "sheetBottomRow": 8,
    "fields": {},
    "models": {}
  },
  "users": {
    "modelName": "User",
    "collectionName": "users",
    "spreadsheetName": "User",
    "sheetBottomRow": 8,
    "fields": {
      "id": {
        "fieldName": "id",
        "displayName": "id",
        "type": "UniqueKey",
        "sheetColumn": 2
      },
      "displayName": {"type": "String", "sheetColumn": 5},
      "bio": {"type": "String", "sheetColumn": 6},
      "openClaims": {"type": "int", "sheetColumn": 14},
      "printCounts": {"type": "Map", "sheetColumn": 14},
      "updates": {
        "type": "List-ForeignKey",
        "typeInfo": "userupdates",
        "sheetColumn": 8
      },
      "claims": {
        "type": "List-ForeignKey",
        "typeInfo": "claims",
        "sheetColumn": 8
      },
      "designs": {
        "type": "List-ForeignKey",
        "typeInfo": "designs",
        "sheetColumn": 13
      },
      "isVerified": {"type": "bool", "sheetColumn": 14},
    },
    "models": {
      "Tkz01qVV6Zbn8PXCJMVibjihuA23": {
        "id": "Tkz01qVV6Zbn8PXCJMVibjihuA23",
        "displayName": "Connor S",
        "bio": "Bio if ppl want to have that",
        "openClaims": 1,
        "printCounts": {},
        "updates": [
          "update1",
          "update2"
        ],
        "claims": [
          "claim1",
          "claim2"
        ],
        "designs": [],
        "isVerified": true,
      },
    }
  }
};
