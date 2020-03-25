{
    "id": "30b86431-038b-4de3-ab6d-ac877433be61",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "RC4_GML",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2020-19-15 10:01:44",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "2c33f5f7-b373-4692-a7e8-b741ae34c268",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "RC4_GML.gml",
            "final": "",
            "functions": [
                {
                    "id": "aba00b01-be3c-4d93-ad93-3cc371d3edd6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        1,
                        2,
                        2
                    ],
                    "externalName": "rc4",
                    "help": "rc4(@buffer, key, offset, length)",
                    "hidden": false,
                    "kind": 2,
                    "name": "rc4",
                    "returnType": 2
                },
                {
                    "id": "36d89cf0-c6d8-40a0-ab44-faae04473ef6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "rc4_decode_string",
                    "help": "rc4_decode_string(str, key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "rc4_decode_string",
                    "returnType": 1
                },
                {
                    "id": "7f202e0b-b08f-4855-9cec-88dea825e87c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "rc4_encode_string",
                    "help": "rc4_encode_string(str, key)",
                    "hidden": false,
                    "kind": 2,
                    "name": "rc4_encode_string",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "aba00b01-be3c-4d93-ad93-3cc371d3edd6",
                "36d89cf0-c6d8-40a0-ab44-faae04473ef6",
                "7f202e0b-b08f-4855-9cec-88dea825e87c"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": -1,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}