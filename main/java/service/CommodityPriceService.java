package com.example.price_report.service;

import com.example.price_report.model.CommodityPrice;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommodityPriceService {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public List<CommodityPrice> loadPricesFromJson() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        // Load the JSON file from the resources folder using InputStream
        try (InputStream inputStream = getClass().getResourceAsStream("/data/commodity_prices.json")) {
            if (inputStream == null) {
                throw new IOException("Resource not found: /data/commodity_prices.json");
            }
            // Read JSON and map to List<CommodityPrice>
            return objectMapper.readValue(inputStream, new TypeReference<List<CommodityPrice>>() {});
        }
    }

    public List<CommodityPrice> filterPricesByDate(List<CommodityPrice> prices, Date selectedDate) {
        return prices.stream()
                .filter(price -> DATE_FORMAT.format(price.getDate()).equals(DATE_FORMAT.format(selectedDate)))
                .collect(Collectors.toList());
    }
}
