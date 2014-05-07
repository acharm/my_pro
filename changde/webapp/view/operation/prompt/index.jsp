<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/view/include/common/normal.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${applicationScope.promptDlgTitle}</title>
    <%@ include file="/view/include/common/meta.jsp"%>
    <%@ include file="/view/include/common/yui3.jsp"%>
    <style type="text/css">
    	.rownotselected { background-color:rgb(250,250,250);position: relative;left: 0px;top: 0px;width: 100%;height: 23px;}
    	.rowselected 	{ background-color:rgb(193,224,253);position: relative;left: 0px;top: 0px;width: 100%;height: 23px;}
    </style>
</head>

<body class="yui3-container yui3-dlg-container yui3-register">

<div id="" style="position:absolute; width:487px; height:210px; top:15px; left:15px; ">
    <div class="yui3-widget yui3-component yui3-pane" >
        <div class="yui3-pane-content" style="z-index: 0;">
            <div class="yui3-pane-bg-container" style="z-index: -1;">
                <div class="yui3-pane-bg yui3-pane-bg-c"></div>
                <div class="yui3-pane-bg yui3-pane-bg-t"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rt"></div>
                <div class="yui3-pane-bg yui3-pane-bg-r"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-b"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-l"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lt"></div>
            </div>
            
            <div id="" class="yui3-pane-container yui3-register-human" style="height:">
                <table class="yui3-register-callerinfo-table">
                    <tr>
                    	<td class="yui3-register-form-table-td">
                    		<table><tbody><tr>
                                    <td class="yui3-register-formfield-header" style="width: 270px;">系统已整合沿街店铺<span style="padding-left: 5px; padding-right: 5px; color: red;" >${shopTotalNum}</span>条</td>
                            </tr></tbody>
                            </table>
						</td>
                    </tr>
                    
                    <tr>
                        <td class="yui3-register-form-table-td">
                            <table><tbody><tr>
                                <td class="yui3-register-formfield-header">店铺名称:</td>
                                <td class="yui3-register-formfield-content">
                                	<input id="shopNameQuery" class="ff-text" type="text" style="width:300px" value=""/>
                                </td>
                                <td>
                                	<span class="yui3-register-searchbtn" id="queryBtn"></span>
                                </td>
                            </tr></tbody></table>
                        </td>
                    </tr>

                    <tr>
						<td class="yui3-register-form-table-td" style="">
							<div id="shopInfoList" style="position:absolute;left:12px;top:66px;width:450px;height:135px;overflow-x:scroll;overflow-y:scroll;">
 								<table id="shopInfoListTitle" border="1px" bordercolor="#B6CDE0" style="text-align:center;height:25px;table-layout:fixed;position:relative;top:0px;left:1px;">
 								</table>
								<table id="shopInfoListDataBody" align="center" border="1px"  bordercolor="#B6CDE0" style="text-align:center;table-layout:fixed;position:relative;top:0px;left:1px;">
								</table> 
							</div>
						</td>
                    </tr>
                    
                </table>
            </div>
        </div>
    </div>
</div>

<div id="" style="position:absolute;width:487px;height:245px;top:246px; left:15px;">
    <div class="yui3-widget yui3-component yui3-pane">
        <div class="yui3-pane-content" style="z-index: 0;">
            <div class="yui3-pane-bg-container" style="z-index: -1;">
                <div class="yui3-pane-bg yui3-pane-bg-c"></div>
                <div class="yui3-pane-bg yui3-pane-bg-t"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rt"></div>
                <div class="yui3-pane-bg yui3-pane-bg-r"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-b"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-l"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lt"></div>
            </div>

            <div class="yui3-pane-container yui3-register-content" >
                <table cellpadding="0" class="yui3-register-form-table" style="width: 100%;">
                    <tr class="yui3-register-form-table-tr yui3-register-form-table-tr-odd">
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" style="width: 228.5px;">
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
                                        	法人姓名:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                        	<input id="tdlegalPersonName" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-labelfield">
                                <div class="yui3-register-form-field-container yui3-labelfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
                                        	联系方式:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                            <input id="tdcontactWay" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr class="yui3-register-form-table-tr">
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											营业证号:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
											<input id="tdbusinessLicence" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											所属区域:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;position:relative;height:21px;">
											<input id="tdareaBelong" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr class="yui3-register-form-table-tr">
                        <td class="yui3-register-form-table-td" colspan=" 2" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-textareafield">
                                <div class="yui3-register-form-field-container yui3-textareafield-content" style="width: 463px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " valign="middle" style="width: 60px; overflow: hidden;">
											营业范围:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 387px;">
                                            <textarea id="tdcommodityScope" value="" readonly="readonly" class="ff-textarea" style="height: 58px; width: 387px;"></textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr class="yui3-register-form-table-tr">
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											注册日期:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                            <input id="tdregistDate" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											到期日期:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                            <input id="tdendDate" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr class="yui3-register-form-table-tr yui3-register-form-table-tr-odd">
                        <td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											营业面积:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                        	<input id="tdshopArea" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
						<td class="yui3-register-form-table-td" colspan=" 1" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-selectboxfield">
                                <div class="yui3-register-form-field-container yui3-selectboxfield-content" style="width: 228.5px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											注册资金:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 153px;">
                                        	<input id="tdregistCapital" readonly="readonly" type="text" style="width: 153px;"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr class="yui3-register-form-table-tr yui3-register-form-table-tr-odd" id="">
                        <td class="yui3-register-form-table-td" colspan=" 2" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-customfield">
                                <div class="yui3-register-form-field-container yui3-customfield-content" style="width: 463px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " style="width: 60px; overflow: hidden;">
											地址:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 387px;">
                                            <div id="">
												<textarea id="tdaddress" value="" readonly="readonly" class="ff-textarea" style="height: 58px; width: 387px;"></textarea>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                </table>
            </div>
        </div>
    </div>
</div>

<div id="" style="position:absolute;width:487px;height:72px;top:512px; left:15px;">
    <div class="yui3-widget yui3-component yui3-pane">
        <div class="yui3-pane-content" style="z-index: 0;">
            <div class="yui3-pane-bg-container" style="z-index: -1;">
                <div class="yui3-pane-bg yui3-pane-bg-c"></div>
                <div class="yui3-pane-bg yui3-pane-bg-t"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rt"></div>
                <div class="yui3-pane-bg yui3-pane-bg-r"></div>
                <div class="yui3-pane-bg yui3-pane-bg-rb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-b"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lb"></div>
                <div class="yui3-pane-bg yui3-pane-bg-l"></div>
                <div class="yui3-pane-bg yui3-pane-bg-lt"></div>
            </div>

            <div class="yui3-pane-container yui3-register-content" >
                <table cellpadding="0" class="yui3-register-form-table" style="width: 100%;">
                    <tr class="yui3-register-form-table-tr">
                        <td class="yui3-register-form-table-td" colspan=" 2" rowspan="1" >
                            <div  class="yui3-widget yui3-formfield yui3-textareafield">
                                <div class="yui3-register-form-field-container yui3-textareafield-content" style="width: 463px;" >
                                    <table>
                                    <tbody>
                                    <tr>
                                        <td title="" class=" yui3-register-formfield-header " valign="middle" style="width: 60px; overflow: hidden;">
											短信内容:
                                        </td>
                                        <td class=" yui3-register-formfield-content " style="width: 387px;">
                                            <textarea id="smscontent" value="" class="ff-textarea" style="height: 58px; width: 387px;" onpropertychange="if(value.length>100) value=value.substr(0,100)"></textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<div id="promptButtonBar" class="yui3-box-controller wbtn-flat" style="display: block;width: ;bottom:5px;left:0px">

    <div id="prompt_textDialBtn" title="${applicationScope.textDialBtn}" class="yui3-box-wbtn yui3-box-wbtn-transit">
        <a class="inner">
            <span class="icon small-icon-dial"></span>
            <span class="text">${applicationScope.textDialBtn}</span>
        </a>
    </div>  

    <div id="prompt_sendBtn" title="${applicationScope.textSmsSendChoice}" class="yui3-box-wbtn yui3-box-wbtn-chk">
        <a class="inner">
            <span class="icon small-icon-sms"></span>
            <span class="text">${applicationScope.textSmsSendChoice}</span>
        </a>
    </div>

    <div id="prompt_saveBtn" title="${applicationScope.textCommonSaveBtn}" class="yui3-box-wbtn yui3-box-wbtn-save">
        <a class="inner">
            <span class="icon small-icon-save"></span>
            <span class="text">${applicationScope.textCommonSaveBtn}</span>
        </a>
    </div>

</div>

<script type="text/javascript">
var recID = "${recID}";
var i18nString = window.i18nString || {};
i18nString = {
        "dataLoading": "${applicationScope.textCommonDataLoading}"
}
</script>
<script type="text/javascript" src="<c:url value='/view/operation/prompt/index.js'/>"></script>

</body>
</html>
