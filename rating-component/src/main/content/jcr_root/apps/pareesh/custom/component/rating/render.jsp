<%--
  ADOBE CONFIDENTIAL
  ___________________

  Copyright 2015 Adobe
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
%><%@ page import="org.apache.commons.lang3.StringUtils,
                  org.apache.sling.api.wrappers.CompositeValueMap,
                  org.apache.sling.commons.json.JSONObject,
                  org.apache.sling.caconfig.resource.ConfigurationResourceResolver,
                  com.adobe.granite.ui.components.AttrBuilder,
                  com.adobe.granite.ui.components.Config,
                  com.adobe.granite.ui.components.ExpressionHelper,
                  com.adobe.granite.ui.components.Field,
                  com.adobe.granite.ui.components.Tag,
                  com.day.cq.i18n.I18n" %><%--###
###--%><%

if (!cmp.getRenderCondition(resource, false).check()) {
    return;
}

Config cfg = cmp.getConfig();

ValueMap vm = (ValueMap) request.getAttribute(Field.class.getName());
ExpressionHelper ex = cmp.getExpressionHelper();

Tag tag = cmp.consumeTag();
AttrBuilder attrs = tag.getAttrs();
cmp.populateCommonAttrs(attrs);

Long maxRating = ex.get(cfg.get("maxRating", "5"), Long.class);
String shape = cfg.get("shape", "star");
String value = vm.get("value", String.class);
String name = cfg.get("name", String.class);

value = StringUtils.isEmpty(value) ? "0" : value;

attrs.addClass("rating-component");
attrs.add("maxcount", maxRating.toString());
attrs.add("shape", shape);
attrs.add("value", value);
attrs.add("name", name);

%><div <%= attrs.build() %> ><%

    for(int index = 0; index < maxRating; index++) {

        AttrBuilder itemAttrs = new AttrBuilder(request, xssAPI);
        itemAttrs.addClass("rating-component-item");
        itemAttrs.add("data-index", index);
        %><div <%= itemAttrs.build() %>><%
            try {
                if (value != null && index < Integer.parseInt(value)) {
                    %><img class="rating-component-image" selected=""/><%
                } else {
                    %><img class="rating-component-image"/><%
                }
            } catch (Exception ignore) {
                %><img class="rating-component-image"/><%
            }
        %></div><%
    }
    %><input type="hidden" class = "foundation-field-related" name = <%= name %> value = <%= value %> />
    <input type="hidden" name = <%= name + "/actualRating@TypeHint" %> value="Long" />
</div>

<ui:includeClientLib categories="component.rating,component.common"/>