{
	"contents": {
		"38b0fad4-d7fd-447b-b355-9a157060138c": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "inputdetermination",
			"subject": "InputDetermination",
			"name": "InputDetermination",
			"documentation": "InputDetermination",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"b92c8eed-c812-4cd4-af3b-1237b4d9e8ca": {
					"name": "Input Selection "
				},
				"3e0aab31-a8f2-48ec-bc22-f8c406142309": {
					"name": "Retrieve Input"
				},
				"a490fe69-c29f-4205-a5e4-ba101377f9d6": {
					"name": "Equipment determination"
				},
				"c2809b33-28e7-44e6-ae14-b1bce2f993a3": {
					"name": "Relo Determination"
				},
				"fe7a9ef1-9015-4454-8358-32009b93425f": {
					"name": "Clean Data"
				},
				"f5a215b0-fe2a-487e-a788-c21481b3f5ea": {
					"name": "Relocation determination"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"19cf50aa-78f1-4168-9a45-75842c3868a2": {
					"name": "SequenceFlow2"
				},
				"6e2b32ba-6a1e-49d8-923f-cabe1856e48f": {
					"name": "SequenceFlow5"
				},
				"ec455e83-8f24-4810-ae1c-e4ff2c2ff053": {
					"name": "Call Relocation entitlements"
				},
				"fa56f003-2521-412f-8924-828c12b65592": {
					"name": "SequenceFlow14"
				},
				"13f7a0de-a463-4f9a-9c94-2a9d26261bf5": {
					"name": "SequenceFlow15"
				},
				"c5cb6ea5-353f-4a4f-9cfa-8634bc392bb6": {
					"name": "SequenceFlow16"
				},
				"55bb03ff-c94c-44c5-acf4-f234de0ccc6c": {
					"name": "Call Equip"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"087f9113-4904-4e1b-b9d0-60002983f2c4": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"b92c8eed-c812-4cd4-af3b-1237b4d9e8ca": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Please Enter Candidate ID and select Company assignment",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"recipientGroups": "",
			"formReference": "/forms/InputCollection.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "InputCollection"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Input Selection "
		},
		"3e0aab31-a8f2-48ec-bc22-f8c406142309": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SF_SFCPART000674_API_OAuth",
			"path": "/User(${context.UserId})",
			"httpMethod": "GET",
			"responseVariable": "${context.response.CInfo}",
			"id": "servicetask1",
			"name": "Retrieve Input",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"a490fe69-c29f-4205-a5e4-ba101377f9d6": {
			"classDefinition": "com.sap.bpm.wfs.ReferencedSubflow",
			"definitionId": "onboard",
			"inParameters": [{
				"sourceExpression": "${context.response.countryCode}",
				"targetVariable": "${context.response.countryCode}"
			}, {
				"sourceExpression": "${context.response.country}",
				"targetVariable": "${context.response.country}"
			}, {
				"sourceExpression": "${context.response.CInfo}",
				"targetVariable": "${context.CInfo}"
			}],
			"outParameters": [],
			"id": "referencedsubflow1",
			"name": "Equipment determination"
		},
		"c2809b33-28e7-44e6-ae14-b1bce2f993a3": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Relo Determination",
			"default": "55bb03ff-c94c-44c5-acf4-f234de0ccc6c"
		},
		"fe7a9ef1-9015-4454-8358-32009b93425f": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/InputDetermination/Clean Data.js",
			"id": "scripttask1",
			"name": "Clean Data"
		},
		"f5a215b0-fe2a-487e-a788-c21481b3f5ea": {
			"classDefinition": "com.sap.bpm.wfs.ReferencedSubflow",
			"workflowReference": "/workflows/onboardIND.workflow",
			"definitionId": "onboardind",
			"inParameters": [{
				"sourceExpression": "${context.response.country}",
				"targetVariable": "${context.response.country}"
			}, {
				"sourceExpression": "${context.response.CInfo}",
				"targetVariable": "${context.CInfo}"
			}, {
				"sourceExpression": "${context.response.countryCode}",
				"targetVariable": "${context.response.countryCode}"
			}],
			"id": "referencedsubflow3",
			"name": "Relocation determination",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca"
		},
		"19cf50aa-78f1-4168-9a45-75842c3868a2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca",
			"targetRef": "fe7a9ef1-9015-4454-8358-32009b93425f"
		},
		"6e2b32ba-6a1e-49d8-923f-cabe1856e48f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "a490fe69-c29f-4205-a5e4-ba101377f9d6",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"ec455e83-8f24-4810-ae1c-e4ff2c2ff053": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.response.country==\"ACE_IND\"}",
			"id": "sequenceflow10",
			"name": "Call Relocation entitlements",
			"sourceRef": "c2809b33-28e7-44e6-ae14-b1bce2f993a3",
			"targetRef": "f5a215b0-fe2a-487e-a788-c21481b3f5ea"
		},
		"fa56f003-2521-412f-8924-828c12b65592": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "3e0aab31-a8f2-48ec-bc22-f8c406142309",
			"targetRef": "c2809b33-28e7-44e6-ae14-b1bce2f993a3"
		},
		"13f7a0de-a463-4f9a-9c94-2a9d26261bf5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "fe7a9ef1-9015-4454-8358-32009b93425f",
			"targetRef": "3e0aab31-a8f2-48ec-bc22-f8c406142309"
		},
		"c5cb6ea5-353f-4a4f-9cfa-8634bc392bb6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "f5a215b0-fe2a-487e-a788-c21481b3f5ea",
			"targetRef": "a490fe69-c29f-4205-a5e4-ba101377f9d6"
		},
		"55bb03ff-c94c-44c5-acf4-f234de0ccc6c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "Call Equip",
			"sourceRef": "c2809b33-28e7-44e6-ae14-b1bce2f993a3",
			"targetRef": "a490fe69-c29f-4205-a5e4-ba101377f9d6"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"f03ec922-431e-42a9-832e-e9a904800360": {},
				"33235729-7bf2-46fb-b362-752704abad72": {},
				"d53a97f5-e7b5-4194-8756-1a021352d2d7": {},
				"8b81e19d-7272-46d6-a35c-4b8388b2b9bb": {},
				"9b824703-19a0-43e7-92e3-dc9b6a159838": {},
				"d1e59a63-9352-4dfc-9e24-b71ff52c8a14": {},
				"dcdda7b5-549d-4407-8865-4155891c51e2": {},
				"8f7b5664-b74c-4974-96a7-e08a00a93d96": {},
				"af7cad1a-c3c5-4f40-900d-d3a4abeb619b": {},
				"a07d0f3f-398b-4fea-931f-5e4f48a4781f": {},
				"e12d3116-7488-4579-88ac-d2f949fd5c1e": {},
				"10e9a510-4ad3-46f6-a804-b1609fdc4b9c": {},
				"18e45019-7074-465f-aec1-603c57c6cdc2": {}
			}
		},
		"087f9113-4904-4e1b-b9d0-60002983f2c4": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/onboard/SampleInputContext.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1158,
			"y": 98,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "16,119.5 135,119.5",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "f03ec922-431e-42a9-832e-e9a904800360",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"f03ec922-431e-42a9-832e-e9a904800360": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 85,
			"y": 93,
			"width": 100,
			"height": 60,
			"object": "b92c8eed-c812-4cd4-af3b-1237b4d9e8ca"
		},
		"33235729-7bf2-46fb-b362-752704abad72": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "135,123 285.75,123 285.75,237 436,237",
			"sourceSymbol": "f03ec922-431e-42a9-832e-e9a904800360",
			"targetSymbol": "8f7b5664-b74c-4974-96a7-e08a00a93d96",
			"object": "19cf50aa-78f1-4168-9a45-75842c3868a2"
		},
		"d53a97f5-e7b5-4194-8756-1a021352d2d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 337,
			"y": 93,
			"width": 97,
			"height": 60,
			"object": "3e0aab31-a8f2-48ec-bc22-f8c406142309"
		},
		"8b81e19d-7272-46d6-a35c-4b8388b2b9bb": {
			"classDefinition": "com.sap.bpm.wfs.ui.ReferencedSubflowSymbol",
			"isAdjustToContent": false,
			"x": 855,
			"y": 100,
			"width": 98,
			"height": 55,
			"object": "a490fe69-c29f-4205-a5e4-ba101377f9d6"
		},
		"9b824703-19a0-43e7-92e3-dc9b6a159838": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "904,121.69791793823242 1175.5,121.69791793823242",
			"sourceSymbol": "8b81e19d-7272-46d6-a35c-4b8388b2b9bb",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "6e2b32ba-6a1e-49d8-923f-cabe1856e48f"
		},
		"d1e59a63-9352-4dfc-9e24-b71ff52c8a14": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 553,
			"y": 95,
			"object": "c2809b33-28e7-44e6-ae14-b1bce2f993a3"
		},
		"dcdda7b5-549d-4407-8865-4155891c51e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "594.5,116 641,116 641,219.5 687.5,219.5",
			"sourceSymbol": "d1e59a63-9352-4dfc-9e24-b71ff52c8a14",
			"targetSymbol": "e12d3116-7488-4579-88ac-d2f949fd5c1e",
			"object": "ec455e83-8f24-4810-ae1c-e4ff2c2ff053"
		},
		"8f7b5664-b74c-4974-96a7-e08a00a93d96": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 386,
			"y": 207,
			"width": 100,
			"height": 60,
			"object": "fe7a9ef1-9015-4454-8358-32009b93425f"
		},
		"af7cad1a-c3c5-4f40-900d-d3a4abeb619b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "385.5,119.5 574,119.5",
			"sourceSymbol": "d53a97f5-e7b5-4194-8756-1a021352d2d7",
			"targetSymbol": "d1e59a63-9352-4dfc-9e24-b71ff52c8a14",
			"object": "fa56f003-2521-412f-8924-828c12b65592"
		},
		"a07d0f3f-398b-4fea-931f-5e4f48a4781f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,237 436,179.75 385.5,179.75 385.5,123",
			"sourceSymbol": "8f7b5664-b74c-4974-96a7-e08a00a93d96",
			"targetSymbol": "d53a97f5-e7b5-4194-8756-1a021352d2d7",
			"object": "13f7a0de-a463-4f9a-9c94-2a9d26261bf5"
		},
		"e12d3116-7488-4579-88ac-d2f949fd5c1e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ReferencedSubflowSymbol",
			"isAdjustToContent": false,
			"x": 687,
			"y": 191,
			"width": 100,
			"height": 57,
			"object": "f5a215b0-fe2a-487e-a788-c21481b3f5ea"
		},
		"10e9a510-4ad3-46f6-a804-b1609fdc4b9c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "788,220.5 821.75,220.5 821.75,126.58333587646484 856.9600219726562,126.58333587646484",
			"sourceSymbol": "e12d3116-7488-4579-88ac-d2f949fd5c1e",
			"targetSymbol": "8b81e19d-7272-46d6-a35c-4b8388b2b9bb",
			"object": "c5cb6ea5-353f-4a4f-9cfa-8634bc392bb6"
		},
		"18e45019-7074-465f-aec1-603c57c6cdc2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "594.5,116 725,116 725,48.675132751464844 855.489990234375,48.675132751464844 855.489990234375,124.29166412353516",
			"sourceSymbol": "d1e59a63-9352-4dfc-9e24-b71ff52c8a14",
			"targetSymbol": "8b81e19d-7272-46d6-a35c-4b8388b2b9bb",
			"object": "55bb03ff-c94c-44c5-acf4-f234de0ccc6c"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 17,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 1,
			"exclusivegateway": 1,
			"parallelgateway": 1,
			"referencedsubflow": 3
		}
	}
}