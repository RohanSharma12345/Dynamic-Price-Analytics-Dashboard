package com.example.price_report.controller;

import com.example.price_report.model.CommodityPrice;
import com.example.price_report.service.CommodityPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.stream.Collectors;

import java.text.ParseException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class PriceReportController {

    @Autowired
    private CommodityPriceService priceService;

    @GetMapping("/form")
    public String showForm() {
        return "form";
    }

    @PostMapping("/getData")
    public String getData(@RequestParam("date") String dateString, Model model) {
        try {
            // Define the allowed dates
            String allowedDate1 = "2024-08-06";
            String allowedDate2 = "2024-08-07";
            String allowedDate3 = "2024-08-08";
            String allowedDate4 = "2024-08-09";
            String allowedDate5 = "2024-08-10";


            model.addAttribute("selectedDate", dateString);

            // Log the selected date for debugging
            System.out.println("Selected Date: " + dateString);

            // Parse the date string to a Date object
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date selectedDate = sdf.parse(dateString);

            // Check if the selected date matches one of the allowed dates
            if (dateString.equals(allowedDate1) || dateString.equals(allowedDate2) || dateString.equals(allowedDate3) || dateString.equals(allowedDate4) || dateString.equals(allowedDate5)) {
                List<CommodityPrice> prices = priceService.loadPricesFromJson();  // Load the prices

                // Log the loaded prices for debugging
                System.out.println("Loaded prices: " + prices.size());

                // Filter prices by date
                List<CommodityPrice> filteredPrices = prices.stream()
                .filter(price -> price.getDate() != null && sdf.format(price.getDate()).equals(sdf.format(selectedDate)))
                        .collect(Collectors.toList());

                // Log the filtered prices for debugging
                System.out.println("Filtered prices: " + filteredPrices.size());

                if (!filteredPrices.isEmpty()) {
                    model.addAttribute("prices", filteredPrices);
                    return "table";
                } else {
                    model.addAttribute("errorMessage", "No data available for the selected date.");
                    return "table";  // Still render the table with the error message
                }
            } else {
                // If the selected date is not allowed, return an error message
                model.addAttribute("errorMessage", "Please select a valid date.");
                return "error"; // Maps to src/main/webapp/WEB-INF/views/error.jsp
            }
        } catch (ParseException e) {
            System.err.println("Date parsing error: " + e.getMessage());
            e.printStackTrace(); // Log the full stack trace for debugging
            model.addAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd format.");
            return "error";
        } catch (IOException e) {
            System.err.println("I/O error: " + e.getMessage());
            e.printStackTrace(); // Log the full stack trace for debugging
            model.addAttribute("errorMessage", "Error reading data.");
            return "error";
        } catch (Exception e) {
            // Enhanced logging
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace(); // This will print the full stack trace to the console
            model.addAttribute("errorMessage", "An unexpected error occurred.");
            return "error"; // Maps to src/main/webapp/WEB-INF/views/error.jsp
        }
    }
}
