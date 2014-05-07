Y.use("yam-core", "yam-utils", "yam-project-service-helper", "jq-slickgrid", "yam-control-tooltip", function(Y){
	var Y2 = Y.YAM, $ = Y.jQuery;
	var getShopInfoList = Y2.ServiceHelper.newService("operation/prompt","getshopinfolist");
	var saveShopSmsInfo = Y2.ServiceHelper.newService("operation/prompt","saveshopsmsinfo");
	var strings = window.i18nString || {};
	var columns = [
	                {name: "rowNum",			width: 29,	content:""			},	{name: "shopName",			width:219,	content:"店铺名称"	},
	                {name: "legalPersonName",	width: 74,	content:"法人姓名"	},	{name: "contactWay", 		width:104,	content:"联系方式"	},
	                {name: "businessLicence",	width: 99,	content:"营业证号"	},	{name: "areaBelong", 		width: 99,	content:"所属区域"	},
	                {name: "registDate", 		width: 99,	content:"注册日期"	},	{name: "endDate", 			width: 99,	content:"到期日期"	},
	                {name: "shopArea", 			width: 99,	content:"营业面积"	},	{name: "registCapital", 	width: 99,	content:"注册资金"	},
	                {name: "commodityScope", 	width:230,	content:"营业范围"	},	{name: "address", 			width:200,	content:"地址", 		}
	                ];
	var shopListData={}, showShopID=""; // Store list info data(to shopListData) using data primary_key(showShopID) as key.
	var _currentShopID="";
	
	var Prompt = {
		init: function(){
			this.showShopInfoList();
			this.bindBtn();
		},
		
		showShopInfoList: function(){
			this.showShopInfoListTitle();
			this.showShopInfoListDataBody({});	// for first time loading use obj {} as null ^_^
		},
		
		showShopInfoListTitle: function(){
			var tbody = document.getElementById("shopInfoListTitle");
			Y.one("#shopInfoListTitle").setStyle("width",function(){ // plus all width(es) as title total width.
				var widthLen=0;for(var i=0;i<columns.length;i++){widthLen=widthLen+columns[i].width+1;}return widthLen+"px";
			}());
			var row = tbody.insertRow(0);
			row.height = "24px";
			for(var i=0; i<columns.length; i++){
				var rowcolumn=row.insertCell(i)
				rowcolumn.width = columns[i].width + "px";
				rowcolumn.innerHTML = "<div rowID='' class='' style='width:"+columns[i].width+"px;background-color:#F3F3F3;height:23px;'>"+columns[i].content+"</div>";
			}
		},
		
		showShopInfoListDataBody: function(val){
			this.showLoading(strings.dataLoading);
			getShopInfoList(val).when(function(data){
				$("#shopInfoListDataBody").text("");	//clear list data
				shopListData = {};
//				// show data
				var list = data.list;
				if(list.length <= 0){
					
				}
				Y.one("#shopInfoListDataBody").setStyle("width",function(){var widthLen=0;for(var i=0;i<columns.length;i++){widthLen=widthLen+columns[i].width+1;}return widthLen+"px";}());
				for(var i=0; i<list.length; i++){
					shopListData[list[i].shopID+""]=list[i];	// store by key
					var tbody = document.getElementById("shopInfoListDataBody");
					var row = tbody.insertRow(i);
					row.height = "24px";
					var rowCell0=row.insertCell(0);	
					rowCell0.width=columns[0].width+"px";
					var rowCellRadio = "<input type='radio' name='shopID' id='rowRadio_"+list[i].shopID+"' class='radioShopID' style='margin:4px' />";
					rowCell0.innerHTML="<div rowID='row_"+list[i].shopID+"' class='row_"+list[i].shopID+" rownotselected row' style='width:"+columns[0].width+"px;cursor:pointer;'>"+rowCellRadio+"</div>";
					for(var j=1; j<columns.length; j++){	// using for loop list column data from second column to end (var j=1)
						var rowCell = row.insertCell(j);
						rowCell.width = columns[j].width + "px";
						if(columns[j].name == "registDate" || columns[j].name == "endDate"){
							var shopData = list[i][columns[j].name]; // if data is null
							if(shopData != null) {
								rowCell.innerHTML = "<div rowID='row_"+list[i].shopID+"' class='row_"+list[i].shopID+" rownotselected row' style='width:"+columns[j].width+"px;'>"+list[i][columns[j].name].substring(0,10)+"</div>";
							}else {
								rowCell.innerHTML = "<div rowID='row_"+list[i].shopID+"' class='row_"+list[i].shopID+" rownotselected row' style='width:"+columns[j].width+"px;'>"+""+"</div>";
							}
						}else{
							rowCell.innerHTML = "<div rowID='row_"+list[i].shopID+"' class='row_"+list[i].shopID+" rownotselected row' style='width:"+columns[j].width+"px;'>"+list[i][columns[j].name]+"</div>";
						}
						
					}
				}
				this.bind();
			},this);
			this.closeTip();
		},
		
		bind: function(){
			Y.one("#queryBtn").on("click", function(){
				this.refreshShopInfoList();
			},this);
			
			Y.all(".rownotselected").on("click", function(ev){
				Y.all(".rowselected").addClass("rownotselected");
				Y.all(".row").removeClass("rowselected");
				var rowID = ev.currentTarget.getAttribute("rowID");
				Y.one("#"+"rowRadio_"+rowID.substring(4,rowID.length)).setAttribute("checked", true);
				_currentShopID = rowID.substring(4,rowID.length)+"";
				Y.all("."+rowID).addClass("rowselected");
				Y.all("."+rowID).removeClass("rownotselected");
				this.showShopInfo(_currentShopID);
			},this);

		},
		
		bindBtn: function(){
			Y.one("#prompt_saveBtn").on("click", function(){
				if(!this.validateInfo()){
					return;
				}
				var val = {};
				this._set_Val(val);
				val.smsSaveFlag = 1;
				saveShopSmsInfo(val).when(function(){
					this.refreshShopInfoList();
					alert("保存成功~!");
				},this);
			}, this);
			
			Y.one("#prompt_sendBtn").on("click", function(){
				if(!this.validateInfo()){
					return;
				}
				var val = {};
				this._set_Val(val);
				val.smsSaveFlag = 2;
				
				saveShopSmsInfo(val).when(function(){
					this.refreshShopInfoList();
					alert("发送成功~!");
				},this);
			}, this);

		},
		
		validateInfo: function(){
			if(_currentShopID==""){
				alert("请选择店铺！");
				return false;
			}
			var smsContent = Y.one("#smscontent").get("value");
			if(smsContent == "" || smsContent == null){
				alert("短信内容不能为空！");
				return false;
			}
			return true;
		},
		
		_set_Val: function(val){
			val.smsID = shopListData[_currentShopID]["smsID"] || -1;				
			val.shopID = _currentShopID;
			val.recID = window.recID;
			val.smsSaveFlag = 1;
			val.smsContent = encodeURIComponent(Y.one("#smscontent").get("value"));
			return val;
		},
		
		refreshShopInfoList: function(){
			_currentShopID="";
			var val = {};
			val.shopName = encodeURIComponent(Y.one("#shopNameQuery").get("value"));
			this.showShopInfoListDataBody(val);
			this.clearShopInfo();
		},
		
		showShopInfo: function(shopID){
			for(var i=2; i<columns.length; i++){
				var inputID="#td"+columns[i].name;
				if(inputID == "#tdregistDate" || inputID == "#tdendDate"){
					if(shopListData[shopID][columns[i].name] == null || shopListData[shopID][columns[i].name] == "") {
						Y.one(inputID).set("value", "");
					}else {
						Y.one(inputID).set("value", shopListData[shopID][columns[i].name].substring(0,10));
					}
				}else{
					Y.one(inputID).set("value", shopListData[shopID][columns[i].name]);
				}
			}

			if(shopListData[shopID]["smsSaveFlag"] == 1){
				Y.one("#smscontent").set("value", shopListData[shopID]["smsContent"]);
			}else{
				Y.one("#smscontent").set("value", "");
			}
		},
		
		clearShopInfo: function(){
			for(var i=2; i<columns.length; i++){
				var inputID="#td"+columns[i].name;
				Y.one(inputID).set("value", "");
			}
			Y.one("#smscontent").set("value","")
		},

		showLoading: function(msg){ 
			Y2.TipUtils.showLoading(msg);
		},
		
		closeTip: function(){
			Y2.TipUtils.closeTip();
		},
	};
	
	Y.on("domready", Y.bind(Prompt.init, Prompt));
});
