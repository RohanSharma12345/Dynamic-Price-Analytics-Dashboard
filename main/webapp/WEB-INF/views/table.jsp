<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.price_report.model.CommodityPrice" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Commodity Price Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            color: #34495e;
            padding: 20px 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px 0;
        }
        .table-wrapper {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }
        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
            letter-spacing: 0.05em;
        }
        tr:nth-child(even) {
            background-color: #f8f8f8;
        }
        tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s ease;
        }
        td {
            color: #555;
        }
        p {
            text-align: center;
            font-size: 16px;
            color: #e74c3c;
            margin-top: 20px;
        }
        /* Responsive adjustments */
        @media (max-width: 768px) {
            th, td {
                font-size: 12px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<h2>Daily Retail Prices of Essential Commodities for <c:out value="${selectedDate}" /></h2>

<div class="container">
    <div class="table-wrapper">
        <c:choose>
            <c:when test="${not empty prices}">
                <table>
                    <thead>
                        <tr>
                            <th>States/UTs</th>
                            <th>Rice</th>
                            <th>Wheat</th>
                            <th>Atta (Wheat)</th>
                            <th>Gram Dal</th>
                            <th>Tur/Arhar Dal</th>
                            <th>Urad Dal</th>
                            <th>Moong Dal</th>
                            <th>Masoor Dal</th>
                            <th>Sugar</th>
                            <th>Milk</th>
                            <th>Groundnut Oil (Packed)</th>
                            <th>Mustard Oil (Packed)</th>
                            <th>Vanaspati (Packed)</th>
                            <th>Soya Oil (Packed)</th>
                            <th>Sunflower Oil (Packed)</th>
                            <th>Palm Oil (Packed)</th>
                            <th>Gur</th>
                            <th>Tea Loose</th>
                            <th>Salt Pack (Iodised)</th>
                            <th>Potato</th>
                            <th>Onion</th>
                            <th>Tomato</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="price" items="${prices}">
                            <tr>
                                <td><c:out value="${price.state}" /></td>
                                <td><c:out value="${price.rice != null ? price.rice : '-'}" /></td>
                                <td><c:out value="${price.wheat != null ? price.wheat : '-'}" /></td>
                                <td><c:out value="${price.atta != null ? price.atta : '-'}" /></td>
                                <td><c:out value="${price.gramDal != null ? price.gramDal : '-'}" /></td>
                                <td><c:out value="${price.turArharDal != null ? price.turArharDal : '-'}" /></td>
                                <td><c:out value="${price.uradDal != null ? price.uradDal : '-'}" /></td>
                                <td><c:out value="${price.moongDal != null ? price.moongDal : '-'}" /></td>
                                <td><c:out value="${price.masoorDal != null ? price.masoorDal : '-'}" /></td>
                                <td><c:out value="${price.sugar != null ? price.sugar : '-'}" /></td>
                                <td><c:out value="${price.milk != null ? price.milk : '-'}" /></td>
                                <td><c:out value="${price.groundnutOil != null ? price.groundnutOil : '-'}" /></td>
                                <td><c:out value="${price.mustardOil != null ? price.mustardOil : '-'}" /></td>
                                <td><c:out value="${price.vanaspati != null ? price.vanaspati : '-'}" /></td>
                                <td><c:out value="${price.soyaOil != null ? price.soyaOil : '-'}" /></td>
                                <td><c:out value="${price.sunflowerOil != null ? price.sunflowerOil : '-'}" /></td>
                                <td><c:out value="${price.palmOil != null ? price.palmOil : '-'}" /></td>
                                <td><c:out value="${price.gur != null ? price.gur : '-'}" /></td>
                                <td><c:out value="${price.teaLoose != null ? price.teaLoose : '-'}" /></td>
                                <td><c:out value="${price.saltPack != null ? price.saltPack : '-'}" /></td>
                                <td><c:out value="${price.potato != null ? price.potato : '-'}" /></td>
                                <td><c:out value="${price.onion != null ? price.onion : '-'}" /></td>
                                <td><c:out value="${price.tomato != null ? price.tomato : '-'}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>No data available for the selected date.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
