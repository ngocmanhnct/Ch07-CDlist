<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="UTF-8">
        <title>Murach's Java Servlets and JSP</title>
        <link rel="stylesheet" href="<c:url value='/styles/main.css'/>" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head> 
    <body>
        <h1>CD List</h1>
        
        <%-- Tạo biến url chung cho action thêm vào giỏ --%>
        <c:url value="/cart" var="cartAction"/>
        
        <table>
            <tr>
                <th>Description</th>
                <th class="right">Price</th>
                <th>&nbsp;</th>
            </tr>
            <tr>
                <td>86 (the band) - True Life Songs and Pictures</td>
                <td class="right">$14.95</td>
                <td>
                    <form action="${cartAction}" method="post">
                        <input type="hidden" name="productCode" value="8601">
                        <button type="submit" name="action" value="add">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The first CD</td>
                <td class="right">$12.95</td>
                <td>
                    <form action="${cartAction}" method="post">                        
                        <input type="hidden" name="productCode" value="pf02">
                        <button type="submit" name="action" value="add">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The second CD</td>
                <td class="right">$14.95</td>
                <td>
                    <form action="${cartAction}" method="post">
                        <input type="hidden" name="productCode" value="pf03">
                        <button type="submit" name="action" value="add">Add To Cart</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td>Joe Rut - Genuine Wood Grained Finish</td>
                <td class="right">$14.95</td>
                <td>
                    <form action="${cartAction}" method="post">
                        <input type="hidden" name="productCode" value="jr01">
                        <button type="submit" name="action" value="add">Add To Cart</button>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>