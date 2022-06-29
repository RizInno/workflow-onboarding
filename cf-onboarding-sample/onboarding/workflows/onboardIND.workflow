{
	"contents": {
		"4bcc7bd0-6f45-4230-ba3b-f067e2d8674b": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "onboardind",
			"subject": "onboardIND",
			"name": "onboardIND",
			"documentation": "onboardIND",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Onboarding India - Start"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "Onboarding India - End"
				}
			},
			"activities": {
				"2c55a34e-f865-43b8-bfda-b8f11b680843": {
					"name": "PrepareReloPage"
				},
				"3d0d3898-b4b8-4322-b6c9-f320348bf274": {
					"name": "Relo Determination"
				},
				"e5b26c15-e9ec-480e-9264-adf403c9a096": {
					"name": "Retrieve Relocation list"
				},
				"f182fc60-70dc-46b9-be0a-7a030184bea1": {
					"name": "Change or Confirm Relocation Entitlements"
				},
				"b8b33a17-4555-4c77-8bfd-0f8cd741cc83": {
					"name": "Approval Determination"
				},
				"fb3a3631-eb0c-42ce-8069-29f40659803c": {
					"name": "Determine if Relo is approved"
				},
				"155aee8b-9dd5-4c47-902d-f8ef54747e6c": {
					"name": "Need Approval"
				},
				"ee3002ad-5c6c-4ea7-91a1-16f5af254ecd": {
					"name": "Approve Relocation Entitlements"
				},
				"2c0377cf-a009-4e42-b57e-13b8f2daf244": {
					"name": "Is approved"
				}
			},
			"sequenceFlows": {
				"93e287f2-789a-4ff6-829d-bc830ce6eaaf": {
					"name": "SequenceFlow2"
				},
				"2e52c3a2-3ccb-448c-ac85-e316ecb64cba": {
					"name": "SequenceFlow3"
				},
				"653561ad-6fe6-4326-95f6-0058a25a9c69": {
					"name": "SequenceFlow4"
				},
				"4314ae10-eb20-4777-a223-b4639ddd396a": {
					"name": "SequenceFlow5"
				},
				"6826317a-1954-4911-b6fe-de718f20b013": {
					"name": "SequenceFlow6"
				},
				"8dfe86a9-ad2a-4769-84cd-9eea93b51deb": {
					"name": "SequenceFlow7"
				},
				"3ed51e94-ea10-4de1-96f9-bd580c2100f4": {
					"name": "SequenceFlow8"
				},
				"52c00e6e-0722-4b86-844d-9711fc620240": {
					"name": "Needs Approval"
				},
				"5e63516d-5939-4328-a13d-73f8478be8ca": {
					"name": "SequenceFlow10"
				},
				"aceab2c5-b0b9-4368-891e-66087b1aa899": {
					"name": "approved"
				},
				"98c045ef-ec21-4e3d-befa-7ce1977a179f": {
					"name": "Rejected"
				},
				"b16f0f32-09c6-48bf-86b5-203327d1f31b": {
					"name": "auto approved"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Onboarding India - Start"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "Onboarding India - End"
		},
		"2c55a34e-f865-43b8-bfda-b8f11b680843": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/PrepareReloPage.js",
			"id": "scripttask1",
			"name": "PrepareReloPage"
		},
		"3d0d3898-b4b8-4322-b6c9-f320348bf274": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "WM_BUSINESSRULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayloadRelo}",
			"responseVariable": "${context.equipment.ReloInfo}",
			"id": "servicetask1",
			"name": "Relo Determination"
		},
		"e5b26c15-e9ec-480e-9264-adf403c9a096": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/Relocation List.js",
			"id": "scripttask2",
			"name": "Retrieve Relocation list"
		},
		"f182fc60-70dc-46b9-be0a-7a030184bea1": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Confirm or Change relocation entitlements for ${context.CInfo.d.firstName} ${context.CInfo.d.lastName}",
			"description": "Review and update relocation entitlements",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/onboardIND/ConfirmOrChangeRelo.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "confirmorchangerelo"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Change or Confirm Relocation Entitlements"
		},
		"b8b33a17-4555-4c77-8bfd-0f8cd741cc83": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/onboardIND/ReloApprovalDetermination.js",
			"id": "scripttask3",
			"name": "Approval Determination"
		},
		"fb3a3631-eb0c-42ce-8069-29f40659803c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "WM_BUSINESSRULES",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayloadrelototal}",
			"responseVariable": "${context.response.reloApprove}",
			"id": "servicetask2",
			"name": "Determine if Relo is approved"
		},
		"155aee8b-9dd5-4c47-902d-f8ef54747e6c": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Need Approval",
			"default": "b16f0f32-09c6-48bf-86b5-203327d1f31b"
		},
		"ee3002ad-5c6c-4ea7-91a1-16f5af254ecd": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve relocation entitlements for ${context.CInfo.d.firstName} ${context.CInfo.d.lastName}",
			"description": "Review and approve Relocation Entitlements",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/onboardIND/ApproveRelo.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approverelo"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "Approve Relocation Entitlements"
		},
		"2c0377cf-a009-4e42-b57e-13b8f2daf244": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Is approved",
			"default": "aceab2c5-b0b9-4368-891e-66087b1aa899"
		},
		"93e287f2-789a-4ff6-829d-bc830ce6eaaf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "2c55a34e-f865-43b8-bfda-b8f11b680843"
		},
		"2e52c3a2-3ccb-448c-ac85-e316ecb64cba": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "2c55a34e-f865-43b8-bfda-b8f11b680843",
			"targetRef": "3d0d3898-b4b8-4322-b6c9-f320348bf274"
		},
		"653561ad-6fe6-4326-95f6-0058a25a9c69": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "3d0d3898-b4b8-4322-b6c9-f320348bf274",
			"targetRef": "e5b26c15-e9ec-480e-9264-adf403c9a096"
		},
		"4314ae10-eb20-4777-a223-b4639ddd396a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "e5b26c15-e9ec-480e-9264-adf403c9a096",
			"targetRef": "f182fc60-70dc-46b9-be0a-7a030184bea1"
		},
		"6826317a-1954-4911-b6fe-de718f20b013": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "f182fc60-70dc-46b9-be0a-7a030184bea1",
			"targetRef": "b8b33a17-4555-4c77-8bfd-0f8cd741cc83"
		},
		"8dfe86a9-ad2a-4769-84cd-9eea93b51deb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "b8b33a17-4555-4c77-8bfd-0f8cd741cc83",
			"targetRef": "fb3a3631-eb0c-42ce-8069-29f40659803c"
		},
		"3ed51e94-ea10-4de1-96f9-bd580c2100f4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "fb3a3631-eb0c-42ce-8069-29f40659803c",
			"targetRef": "155aee8b-9dd5-4c47-902d-f8ef54747e6c"
		},
		"52c00e6e-0722-4b86-844d-9711fc620240": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.response.reloApprove.Result[0].RelocationApproval.Approvalneeded=='true'}",
			"id": "sequenceflow9",
			"name": "Needs Approval",
			"sourceRef": "155aee8b-9dd5-4c47-902d-f8ef54747e6c",
			"targetRef": "ee3002ad-5c6c-4ea7-91a1-16f5af254ecd"
		},
		"5e63516d-5939-4328-a13d-73f8478be8ca": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "ee3002ad-5c6c-4ea7-91a1-16f5af254ecd",
			"targetRef": "2c0377cf-a009-4e42-b57e-13b8f2daf244"
		},
		"aceab2c5-b0b9-4368-891e-66087b1aa899": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "approved",
			"sourceRef": "2c0377cf-a009-4e42-b57e-13b8f2daf244",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"98c045ef-ec21-4e3d-befa-7ce1977a179f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision==\"reject\"}",
			"id": "sequenceflow12",
			"name": "Rejected",
			"sourceRef": "2c0377cf-a009-4e42-b57e-13b8f2daf244",
			"targetRef": "f182fc60-70dc-46b9-be0a-7a030184bea1"
		},
		"b16f0f32-09c6-48bf-86b5-203327d1f31b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "auto approved",
			"sourceRef": "155aee8b-9dd5-4c47-902d-f8ef54747e6c",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"75270f8d-6f98-41e6-98ef-7152d464a912": {},
				"c801eec8-151f-4c83-a4b6-84e66f0b6939": {},
				"ff03cf4e-7022-4c10-b1ee-cdab54e098a4": {},
				"ddd5dbce-1cfa-4d72-ab42-be79fb2483dc": {},
				"af387469-6cdb-4342-ae60-07a3380677e1": {},
				"ac36fbcd-868d-4f2e-9c09-7a61d844171c": {},
				"db77f6de-3662-4a96-aad3-47e4e8ebb80b": {},
				"d44518fb-9cbd-4ce3-a272-42f1186a39d1": {},
				"f0097955-c7db-4f26-af19-348264382df7": {},
				"c97fabe0-14e1-4670-9a79-0bb2ed29c362": {},
				"5c523173-c6e8-4018-b589-fe70f6f19b63": {},
				"52d6a775-fb70-45fc-baa2-03d60038db08": {},
				"d92c56cb-6d96-4771-be4d-0ae24cc37b2c": {},
				"4102499d-d211-4260-9f3c-94574d82f1b6": {},
				"e461b7c1-c0be-4ab4-9eb3-9f02c223c040": {},
				"20db12d0-7630-477e-83c4-a66cc9922439": {},
				"64bb7fd3-5c38-4831-8c72-a0eb1c4950c5": {},
				"03f0c9d7-ed5b-4846-9e52-87291b2cf63c": {},
				"7035d4c3-b140-40b3-88d8-feb9393c97c1": {},
				"2ad738fd-6f43-46e3-9aa4-bbaa999f4584": {},
				"3c51a75c-77fc-4e50-aa1e-276ba78912d2": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 27,
			"y": -158.00000029802322,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1134.9999952316284,
			"y": 122.5,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"75270f8d-6f98-41e6-98ef-7152d464a912": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 142.9999988079071,
			"y": -172.00000029802322,
			"width": 100,
			"height": 60,
			"object": "2c55a34e-f865-43b8-bfda-b8f11b680843"
		},
		"c801eec8-151f-4c83-a4b6-84e66f0b6939": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "59,-142.00000029802322 142.9999988079071,-142.00000029802322",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "75270f8d-6f98-41e6-98ef-7152d464a912",
			"object": "93e287f2-789a-4ff6-829d-bc830ce6eaaf"
		},
		"ff03cf4e-7022-4c10-b1ee-cdab54e098a4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "242.9999988079071,-142.00000029802322 302.9999976158142,-142",
			"sourceSymbol": "75270f8d-6f98-41e6-98ef-7152d464a912",
			"targetSymbol": "ddd5dbce-1cfa-4d72-ab42-be79fb2483dc",
			"object": "2e52c3a2-3ccb-448c-ac85-e316ecb64cba"
		},
		"ddd5dbce-1cfa-4d72-ab42-be79fb2483dc": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 302.9999976158142,
			"y": -172,
			"width": 100,
			"height": 60,
			"object": "3d0d3898-b4b8-4322-b6c9-f320348bf274"
		},
		"af387469-6cdb-4342-ae60-07a3380677e1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "402.9999976158142,-142 467.9999964237213,-142",
			"sourceSymbol": "ddd5dbce-1cfa-4d72-ab42-be79fb2483dc",
			"targetSymbol": "ac36fbcd-868d-4f2e-9c09-7a61d844171c",
			"object": "653561ad-6fe6-4326-95f6-0058a25a9c69"
		},
		"ac36fbcd-868d-4f2e-9c09-7a61d844171c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 467.9999964237213,
			"y": -172,
			"width": 100,
			"height": 60,
			"object": "e5b26c15-e9ec-480e-9264-adf403c9a096"
		},
		"db77f6de-3662-4a96-aad3-47e4e8ebb80b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "567.9999964237213,-142 618.5,-142 618.5,9.25 69.5,9.25 69.5,160.5 119.99999523162842,160.5",
			"sourceSymbol": "ac36fbcd-868d-4f2e-9c09-7a61d844171c",
			"targetSymbol": "d44518fb-9cbd-4ce3-a272-42f1186a39d1",
			"object": "4314ae10-eb20-4777-a223-b4639ddd396a"
		},
		"d44518fb-9cbd-4ce3-a272-42f1186a39d1": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 119.99999523162842,
			"y": 130.5,
			"width": 100,
			"height": 60,
			"object": "f182fc60-70dc-46b9-be0a-7a030184bea1"
		},
		"f0097955-c7db-4f26-af19-348264382df7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "219.99999523162842,160.75 294.9999940395355,160.75",
			"sourceSymbol": "d44518fb-9cbd-4ce3-a272-42f1186a39d1",
			"targetSymbol": "c97fabe0-14e1-4670-9a79-0bb2ed29c362",
			"object": "6826317a-1954-4911-b6fe-de718f20b013"
		},
		"c97fabe0-14e1-4670-9a79-0bb2ed29c362": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 294.9999940395355,
			"y": 131,
			"width": 100,
			"height": 60,
			"object": "b8b33a17-4555-4c77-8bfd-0f8cd741cc83"
		},
		"5c523173-c6e8-4018-b589-fe70f6f19b63": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "394.9999940395355,161 467.9999928474426,160.99999970197678",
			"sourceSymbol": "c97fabe0-14e1-4670-9a79-0bb2ed29c362",
			"targetSymbol": "52d6a775-fb70-45fc-baa2-03d60038db08",
			"object": "8dfe86a9-ad2a-4769-84cd-9eea93b51deb"
		},
		"52d6a775-fb70-45fc-baa2-03d60038db08": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 467.9999928474426,
			"y": 130.99999970197678,
			"width": 100,
			"height": 60,
			"object": "fb3a3631-eb0c-42ce-8069-29f40659803c"
		},
		"d92c56cb-6d96-4771-be4d-0ae24cc37b2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "553.9999928474426,154.99999970197678 619.9999988079071,154.99999970197678",
			"sourceSymbol": "52d6a775-fb70-45fc-baa2-03d60038db08",
			"targetSymbol": "4102499d-d211-4260-9f3c-94574d82f1b6",
			"object": "3ed51e94-ea10-4de1-96f9-bd580c2100f4"
		},
		"4102499d-d211-4260-9f3c-94574d82f1b6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 618.9999988079071,
			"y": 130.99999970197678,
			"object": "155aee8b-9dd5-4c47-902d-f8ef54747e6c"
		},
		"e461b7c1-c0be-4ab4-9eb3-9f02c223c040": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "660.9999988079071,152.4999998509884 770.9999976158142,152.4999998509884",
			"sourceSymbol": "4102499d-d211-4260-9f3c-94574d82f1b6",
			"targetSymbol": "20db12d0-7630-477e-83c4-a66cc9922439",
			"object": "52c00e6e-0722-4b86-844d-9711fc620240"
		},
		"20db12d0-7630-477e-83c4-a66cc9922439": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 770.9999976158142,
			"y": 123,
			"width": 100,
			"height": 60,
			"object": "ee3002ad-5c6c-4ea7-91a1-16f5af254ecd"
		},
		"64bb7fd3-5c38-4831-8c72-a0eb1c4950c5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "870.9999976158142,152.5 956.9999964237213,152.5",
			"sourceSymbol": "20db12d0-7630-477e-83c4-a66cc9922439",
			"targetSymbol": "03f0c9d7-ed5b-4846-9e52-87291b2cf63c",
			"object": "5e63516d-5939-4328-a13d-73f8478be8ca"
		},
		"03f0c9d7-ed5b-4846-9e52-87291b2cf63c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 956.9999964237213,
			"y": 131,
			"object": "2c0377cf-a009-4e42-b57e-13b8f2daf244"
		},
		"7035d4c3-b140-40b3-88d8-feb9393c97c1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "998.9999964237213,152 1067,152 1067,140 1134.9999952316284,140",
			"sourceSymbol": "03f0c9d7-ed5b-4846-9e52-87291b2cf63c",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "aceab2c5-b0b9-4368-891e-66087b1aa899"
		},
		"2ad738fd-6f43-46e3-9aa4-bbaa999f4584": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "977.9999964237213,131.5 978,80 170,80 169.99999523162842,131",
			"sourceSymbol": "03f0c9d7-ed5b-4846-9e52-87291b2cf63c",
			"targetSymbol": "d44518fb-9cbd-4ce3-a272-42f1186a39d1",
			"object": "98c045ef-ec21-4e3d-befa-7ce1977a179f"
		},
		"3c51a75c-77fc-4e50-aa1e-276ba78912d2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "639.9999988079071,172.49999970197678 640,223 1152.5,223 1152.4999952316284,157",
			"sourceSymbol": "4102499d-d211-4260-9f3c-94574d82f1b6",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "b16f0f32-09c6-48bf-86b5-203327d1f31b"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 13,
			"startevent": 1,
			"endevent": 1,
			"usertask": 2,
			"servicetask": 2,
			"scripttask": 3,
			"exclusivegateway": 2
		}
	}
}