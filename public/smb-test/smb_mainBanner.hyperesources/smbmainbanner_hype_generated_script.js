//	HYPE.documents["smb_mainBanner"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "smb_mainBanner.hyperesources";
	var documentName = "smb_mainBanner";
	var documentLoaderFilename = "smbmainbanner_hype_generated_script.js";
	var mainContainerID = "smbmainbanner_hype_container";

	// find the URL for this script's absolute path and set as the resourceFolderName
	try {
		var scripts = document.getElementsByTagName('script');
		for(var i = 0; i < scripts.length; i++) {
			var scriptSrc = scripts[i].src;
			if(scriptSrc != null && scriptSrc.indexOf(documentLoaderFilename) != -1) {
				resourcesFolderName = scriptSrc.substr(0, scriptSrc.lastIndexOf("/"));
				break;
			}
		}
	} catch(err) {	}

	// Legacy support
	if (typeof window.HYPE_DocumentsToLoad == "undefined") {
		window.HYPE_DocumentsToLoad = new Array();
	}
 
	// load HYPE.js if it hasn't been loaded yet
	if(typeof HYPE_160 == "undefined") {
		if(typeof window.HYPE_160_DocumentsToLoad == "undefined") {
			window.HYPE_160_DocumentsToLoad = new Array();
			window.HYPE_160_DocumentsToLoad.push(HYPE_DocumentLoader);

			var headElement = document.getElementsByTagName('head')[0];
			var scriptElement = document.createElement('script');
			scriptElement.type= 'text/javascript';
			scriptElement.src = resourcesFolderName + '/' + 'HYPE.js?hype_version=160';
			headElement.appendChild(scriptElement);
		} else {
			window.HYPE_160_DocumentsToLoad.push(HYPE_DocumentLoader);
		}
		return;
	}
	
	// handle attempting to load multiple times
	if(HYPE.documents[documentName] != null) {
		var index = 1;
		var originalDocumentName = documentName;
		do {
			documentName = "" + originalDocumentName + "-" + (index++);
		} while(HYPE.documents[documentName] != null);
		
		var allDivs = document.getElementsByTagName("div");
		var foundEligibleContainer = false;
		for(var i = 0; i < allDivs.length; i++) {
			if(allDivs[i].id == mainContainerID && allDivs[i].getAttribute("HYPE_documentName") == null) {
				var index = 1;
				var originalMainContainerID = mainContainerID;
				do {
					mainContainerID = "" + originalMainContainerID + "-" + (index++);
				} while(document.getElementById(mainContainerID) != null);
				
				allDivs[i].id = mainContainerID;
				foundEligibleContainer = true;
				break;
			}
		}
		
		if(foundEligibleContainer == false) {
			return;
		}
	}
	
	var hypeDoc = new HYPE_160();
	
	var attributeTransformerMapping = {b:"i",c:"i",bC:"i",d:"i",aS:"i",M:"i",e:"f",aT:"i",N:"i",f:"d",O:"i",g:"c",aU:"i",P:"i",Q:"i",aV:"i",R:"c",bG:"f",aW:"f",aI:"i",S:"i",bH:"d",l:"d",aX:"i",T:"i",m:"c",bI:"f",aJ:"i",n:"c",aK:"i",bJ:"f",X:"i",aL:"i",A:"c",aZ:"i",Y:"bM",B:"c",bK:"f",bL:"f",C:"c",D:"c",t:"i",E:"i",G:"c",bA:"c",a:"i",bB:"i"};
	
	var resources = {"0":{n:"slider1_image.png",p:1},"1":{n:"slider7_image.png",p:1},"2":{n:"slider2_image.png",p:1}};
	
	var scenes = [{x:0,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:1,sceneSymbol:1}],v:{"3":{aV:8,w:"So, how do you bring her through your doors?\n",a:584,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:553,k:"div",z:"3",d:134,aT:8,F:"right",t:45,b:184,aU:8,G:"#000000",aS:8},"30":{o:"content-box",h:"0",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",r:"inline",c:1200,k:"div",z:"1",d:454},"2":{aV:8,w:"She lives near your business. \n",a:553,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:601,k:"div",z:"2",d:75,aT:8,t:45,b:66,aS:8,aU:8,G:"#000000"},"32":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"4",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"}},n:"Untitled Scene",T:{kTimelineDefaultIdentifier:{d:6,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"1"},{x:1,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:2,sceneSymbol:1}],v:{"7":{aV:8,w:"You could try her local newspaper, but you\u2019ll pay three times more.\n",a:646,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:502,k:"div",z:"2",d:230,aT:8,F:"right",t:45,b:144,aU:8,G:"#000000",aS:8},"33":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"3",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"},"38":{o:"content-box",h:"2",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",r:"inline",c:1200,k:"div",z:"1",d:454}},n:"Untitled Scene Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"8"},{x:2,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:5,sceneSymbol:1}],v:{"9":{aV:8,w:"Or, you can reach her here just 24 hours from now.",a:39,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:545,k:"div",z:"1",d:132,aT:8,t:45,b:300,aS:8,aU:8,G:"#000000"},"34":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"2",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"}},n:"Untitled Scene Copy Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"11"},{x:3,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:1,sceneSymbol:1}],v:{"12":{aV:8,w:"You don\u2019t have to look like this",a:45,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:753,k:"div",z:"1",d:131,aT:8,t:45,b:40,aS:8,aU:8,G:"#000000"},"15":{aV:8,w:"We will make you look like this for FREE",a:45,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:970,k:"div",z:"4",d:131,aT:8,t:45,b:103,aS:8,aU:8,G:"#000000"},"35":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"5",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"}},n:"Untitled Scene Copy Copy Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"14"},{x:4,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:1,sceneSymbol:1}],v:{"17":{aU:8,G:"#005691",c:1028,aV:8,r:"inline",d:131,s:"Times,'Times New Roman',Georgia,Serif",t:64,Z:"break-word",w:"\u201cIn only a little under two weeks, we had over 1,200 clicks on our ad!\u201d",j:"absolute",x:"visible",k:"div",y:"preserve",z:"4",aS:8,aT:8,a:70,F:"center",b:141},"16":{aV:8,w:"You might even see a result like this:",a:45,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:753,k:"div",z:"1",d:131,aT:8,t:45,b:40,aS:8,aU:8,G:"#000000"},"36":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"6",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"},"20":{aV:8,w:"-Jessie Meador\nPiedmont Distillers, LLC",a:70,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"5",k:"div",b:364,aT:8,aS:8,t:16,aU:8,G:"#000000"}},n:"Untitled Scene Copy Copy Copy Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"19"},{x:5,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:1,sceneSymbol:1}],v:{"37":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"2",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"},"22":{aV:8,w:"Just tell us a little about your audience, and you\u2019ll be ready to go in less than 5 minutes.",a:75,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:1033,k:"div",z:"1",d:150,aT:8,t:45,b:164,aS:8,aU:8,G:"#000000"}},n:"Untitled Scene Copy Copy Copy Copy Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"25"},{x:6,p:"600px",c:"#FFFFFF",onSceneTimelineCompleteActions:[{type:1,transition:1,sceneSymbol:3}],v:{"29":{aV:8,w:"So why are you waiting?",a:550,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:598,k:"div",z:"5",d:67,aT:8,F:"right",t:45,b:125,aU:8,G:"#000000",aS:8},"26":{aV:8,w:"She\u2019s online right now. ",a:612,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",c:521,k:"div",z:"2",d:67,aT:8,F:"right",t:45,b:51,aU:8,G:"#000000",aS:8},"27":{aV:8,w:"GET STARTED",a:1009,x:"visible",Z:"break-word",y:"preserve",j:"absolute",r:"inline",z:"4",k:"div",b:390,aT:8,aS:8,t:20,aU:8,G:"#892820",v:"bold"},"31":{o:"content-box",h:"1",x:"visible",a:0,q:"100% 100%",b:0,j:"absolute",r:"inline",c:1200,k:"div",z:"1",d:454}},n:"Untitled Scene Copy Copy Copy Copy Copy Copy",T:{kTimelineDefaultIdentifier:{d:5,i:"kTimelineDefaultIdentifier",n:"Main Timeline",a:[],f:30}},o:"28"}];
	
	var javascripts = [];
	
	var functions = {};
	var javascriptMapping = {};
	for(var i = 0; i < javascripts.length; i++) {
		try {
			javascriptMapping[javascripts[i].identifier] = javascripts[i].name;
			eval("functions." + javascripts[i].name + " = " + javascripts[i].source);
		} catch (e) {
			hypeDoc.log(e);
			functions[javascripts[i].name] = (function () {});
		}
	}
	
	hypeDoc.setAttributeTransformerMapping(attributeTransformerMapping);
	hypeDoc.setResources(resources);
	hypeDoc.setScenes(scenes);
	hypeDoc.setJavascriptMapping(javascriptMapping);
	hypeDoc.functions = functions;
	hypeDoc.setCurrentSceneIndex(0);
	hypeDoc.setMainContentContainerID(mainContainerID);
	hypeDoc.setResourcesFolderName(resourcesFolderName);
	hypeDoc.setShowHypeBuiltWatermark(0);
	hypeDoc.setShowLoadingPage(false);
	hypeDoc.setDrawSceneBackgrounds(true);
	hypeDoc.setGraphicsAcceleration(true);
	hypeDoc.setDocumentName(documentName);

	HYPE.documents[documentName] = hypeDoc.API;
	document.getElementById(mainContainerID).setAttribute("HYPE_documentName", documentName);

	hypeDoc.documentLoad(this.body);
}());

