<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>{{$language.SessionsList}}</title>
<meta name="generator" content="editplus">
<meta name="author" content="nuttycoder">
<link href="{{$template_root}}/all_purpose_style.css" rel="stylesheet" type="text/css" />

<script src="./template/admin/cssjs/jscal2.js"></script>
<script src="./template/admin/cssjs/cn.js"></script>
<link type="text/css" rel="stylesheet" href="./template/admin/cssjs/jscal2.css" />
<link type="text/css" rel="stylesheet" href="./template/admin/cssjs/border-radius.css" />
<SCRIPT>
	function my_confirm(str){
		if(!confirm("确认要" + str + "？"))
		{
			window.event.returnValue = false;
		}
	}
	function chk_form(){
		for(var i = 0; i < document.list.elements.length;i++){
			var e = document.list.elements[i];
			if(e.name == 'chk_member[]' && e.checked == true)
				return true;
		}
		alert("您没有选任何记录！");
		return false;
	}
</SCRIPT>
</head>
<body>
<style type="text/css">
a {
    color: #003499;
    text-decoration: none;
} 
a:hover {
    color: #000000;
    text-decoration: underline;
}
</style>
<td width="84%" align="left" valign="top">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
<tr><td valign="middle" class="hui_bj" align="left">
<div class="menu">
<ul>
<li class="me_a"><img src="{{$template_root}}/images/an1.jpg" align="absmiddle"/><a href="admin.php?controller=admin_listdatalog">监控审计</a><img src="{{$template_root}}/images/an3.jpg" align="absmiddle"/></li>

</ul>
</div>
</td></tr>

  <tr>
    <td >
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_content">
  <tr>
    <td>
    <FORM  method=get name=f1   onSubmit="return false;"    action=admin.php>
      <INPUT id="controller " value=admin_listdatalog type=hidden name=c>
      <INPUT id=action value=index type=hidden   name=a> 	
		      主机:<INPUT name=host  size="12" class="wbk">
		      <INPUT  size="12" class="bnnew2"  onClick="JavaScript: document.getElementById('action').value='index';submit();" value=查找  type=button> 
	</FORM>
</td>
  </tr>
</table>	

	  </td>
  </tr>
  <tr><td>
  <table bordercolor="white" cellspacing="0" cellpadding="5" border="0" width="100%" class="BBtable">
	 <FORM method=post name=list     action=admin.php?controller=admin_listdatalog&amp;a=delete_all>
					
				<tr>
					 <TH width="3%" class="list_bg">选</TH>
			          <TH width="3%" class="list_bg">ID</TH>	  
			          <TH width="8%" class="list_bg">主机</TH>
					  <TH width="10%" class="list_bg">时间</TH>
					  <TH width="20%" class="list_bg">监控参数</TH>
					  <TH width="6%" class="list_bg">状态</TH>
						
					</tr>
					 {{section name=t loop=$alllogs}}
  			 <TR class="list_tr_bg{{if $smarty.section.t.index % 2 ne 0}}1{{/if}}">
	    			 <TD><INPUT value={{$alllogs[t].id}} type=checkbox name=chk_member[]></TD>
			          <TD>{{$smarty.section.t.index+1}}</TD>
			          <TD>{{$alllogs[t].ip}}</TD>
			          <TD>{{$alllogs[t].time}}</TD>
					  <TD>{{$alllogs[t].name}}</TD>
					   <TD>{{if $alllogs[t].last_value eq '-1'}}无法连接{{elseif $alllogs[t].last_value eq '1'}}超值{{/if}}</TD>
					</tr>
					{{/section}}
		<TR>
          <TD colSpan=6 align=left>
          <INPUT  onclick="javascript:for(var i=0;i<this.form.elements.length;i++){var e=this.form.elements[i];if(e.name=='chk_member[]')e.checked=this.form.select_all.checked;}" 
            value=checkbox type=checkbox name=select_all>选本页显示的所有记录&nbsp;&nbsp;<INPUT class=an_02 onClick="my_confirm('删除所选记录');if(!chk_form())  return false;" value=批量删除所选记录 type=submit>      
            </TD>
         </TR>
				</FORM>	
					<tr>
						<td height="45" colspan="6" align="right" bgcolor="#FFFFFF">
							{{$language.all}}{{$session_num}}{{$language.Session}}  {{$page_list}}  {{$language.Page}}：{{$curr_page}}/{{$total_page}}{{$language.page}}  {{$items_per_page}}条/每页 
							  转到第<input name="pagenum" type="text" size="2" onKeyPress="if(event.keyCode==13) window.location='{{$curr_url}}&page='+this.value;" class="wbk">
							  页&nbsp;  
						</td>
					</tr>
				</table>
	</td>
  </tr>
</table></td>


</body>
</html>


