<%--
  ADOBE CONFIDENTIAL
  ___________________

  Copyright 2016 Adobe
  All Rights Reserved.

  NOTICE: All information contained herein is, and remains
  the property of Adobe and its suppliers, if any. The intellectual
  and technical concepts contained herein are proprietary to Adobe
  and its suppliers and are protected by all applicable intellectual
  property laws, including trade secret and copyright laws.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe.
--%><%
%><%@ include file="/libs/granite/ui/global.jsp" %><%
%><%@ page session="false"
          import="com.adobe.granite.ui.components.AttrBuilder,
                  com.adobe.granite.ui.components.Config,
                  org.slf4j.Logger,
                  org.slf4j.LoggerFactory,
				  java.util.Iterator,
                  com.adobe.granite.ui.components.Tag" %><%--###
###--%><%
final Logger logger = LoggerFactory.getLogger("apps.granite.ui.components.picker.table.child");

final Config cfg = cmp.getConfig();

Tag tag = cmp.consumeTag();
AttrBuilder attrs = tag.getAttrs();

final Resource content = resource.getChild("jcr:content");

String name = resource.getName();
String title = content != null ? content.getValueMap().get("jcr:title", "Test Folder") : "";
String path = resource.getPath();
String thumbnail = resource.getPath() + ".thumb." + 800 + "." + 600 + ".png";

%><tr <%= attrs %> is="coral-table-row">
    <td is="coral-table-cell" coral-table-rowselect><img src="<%= thumbnail %>"></td>
    <td is="coral-table-cell"><%= name %></td>
    <td is="coral-table-cell"><%= title %></td>
    <td is="coral-table-cell"><%= path %></td>
</tr>
