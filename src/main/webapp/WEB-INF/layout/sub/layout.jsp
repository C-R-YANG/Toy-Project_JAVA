<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Document</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=6; IE=7; IE=8; IE=9; IE=10; IE=edge" />

        <%@ include file="/WEB-INF/layout/commonTags.jspf"%>
        <%@ include file="/WEB-INF/layout/commonJS.jspf"%>
    </head>
    <body>
        <div id="layout">
            <div id="contents"><tiles:insertAttribute name="body"   /></div>
        </div>
    </body>
</html>