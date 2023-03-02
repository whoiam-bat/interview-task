package com.ua.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Purchase {

    private int purchaseId;

    private String title;

    private String description;

    private LocalDate dateCreated;
}
