<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department of Consumer Affairs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #a1c3b2;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #a40d0d;
            color: white;
            padding: 10px;
            text-align: left;
            font-size: 1.5em;
            font-weight: bold;
        }

        .content {
            background-color: #f7f7b7;
            padding: 20px;
            margin: 20px;
        }

        .form-section {
            background-color: #b8c7b8;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .form-section select,
        .form-section input[type="radio"] {
            margin-bottom: 20px;
            margin-right: 5px;
        }

        .footer {
            background-color: #a40d0d;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
            font-size: 0.9em;
        }

        .form-section input[type="submit"] {
            padding: 10px 20px;
            background-color: #FF6F61;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            margin-top: 10px;
        }

        .form-section input[type="submit"]:hover {
            background-color: #e65c54;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #a40d0d;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>

<body>
    <div class="header">
        DEPARTMENT OF CONSUMER AFFAIRS PMS Version 2.0
    </div>
    <form action="/getData" method="post">
        <div class="content">
            <div class="form-section">

                <img src=""
                    alt="Ashoka Emblem" height="100px" width="100px" />

                <label for="reportType">Report Type:</label>
                <select id="reportType" name="reportType">
                    <option value="retail">Retail</option>
                    <option value="wholesale">Wholesale</option>
                </select>

                <label for="language">Select Language:</label>
                <select id="language" name="language">
                    <option value="english">English</option>
                    <option value="hindi">Hindi</option>
                </select>
                <br><br>

                <input type="radio" id="priceReport" name="report" value="priceReport">
                <label for="priceReport">Price report</label>

                <input type="radio" id="variationReport" name="report" value="variationReport">
                <label for="variationReport">Variation Report</label>

                <input type="radio" id="averageReport" name="report" value="averageReport">
                <label for="averageReport">Average/Month End Report</label>

                <input type="radio" id="timeSpanReport" name="report" value="timeSpanReport">
                <label for="timeSpanReport">Variation Report for Selected Time Span</label>
                <br><br>

                <label for="Criteria">Criteria:</label>
                <select id="Criterias" name="criteria">
                    <option value="">------Select------</option>
                    <option value="DailyPrices">Daily Prices</option>
                    <option value="Zonewise Average Prices">Zonewise Average Prices</option>
                </select>

                <label for="stateSelect">State/UTs:</label>
                <select id="stateSelect" name="stateSelect">
                    <option value="">------Select------</option>
                    <option value="All States">All States</option>
                    <option value="All Union Teritories">All UTs</option>
                </select>
                <br><br>

                <!-- Added Date input and Get Data button -->
                <label for="date">Date:</label>
                <input type="date" id="date" name="date">
                <br><br>

                <input type="submit" value="Get Data">

            </div>

            <div class="content">
                <p><strong>Disclaimer:</strong> Price data reported by State/UTs on Saturday, Sunday and holidays are
                    subjected to verification on the next working day. Till such time the figures are to be treated as
                    provisional.</p>
            </div>
        </div>

        <div class="footer">
            Designed and Developed By: National Informatics Centre (NIC) &nbsp;&nbsp;|&nbsp;&nbsp; Visitor Count:
            13107328
        </div>
    </form>
</body>

</html>
