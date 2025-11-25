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
        <h1>Your cart</h1>
        <table>
            <tr>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th>Amount</th>
                <th>&nbsp;</th> 
            </tr>

            <%-- Kiểm tra giỏ hàng có tồn tại và có sản phẩm không --%>
            <c:choose>
                <c:when test="${cart != null && cart.items.size() > 0}">
                    <%-- Duyệt qua từng sản phẩm trong giỏ (LineItem) --%>
                    <c:forEach var="item" items="${cart.items}">
                        <tr>
                            <td>
                                <c:url value="/cart" var="updateUrl"/>
                                <form action="${updateUrl}" method="post">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="productCode" value="${item.product.code}">
                                    <input type="text" name="quantity" value="${item.quantity}">
                                    <input type="submit" value="Update">
                                </form>
                            </td>

                            <td>${item.product.description}</td>

                            <td class="right">${item.product.priceCurrencyFormat}</td>

                            <td class="right">${item.totalCurrencyFormat}</td>

                            <td>
                                <c:url value="/cart" var="removeUrl"/>
                                <form action="${removeUrl}" method="post">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="productCode" value="${item.product.code}">
                                    <input type="submit" value="Remove Item">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">Cart is empty</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>

        <p>To change the quantity, enter the new quantity and click on the Update button.</p>

        <c:url value="/cart" var="shopUrl"/>
        <form action="${shopUrl}" method="post">
            <input type="hidden" name="action" value="shop">
            <input type="submit" value="Continue Shopping">
        </form> <br>

        <%-- Checkout action (giả sử chuyển hướng đến trang checkout hoặc servlet) --%>
        <c:url value="/checkout" var="checkoutUrl"/>
        <form action="${checkoutUrl}" method="post">
            <input type="hidden" name="action" value="checkout">
            <input type="submit" value="Checkout">
        </form>
    </body>
</html>