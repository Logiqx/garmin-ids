## Fixes

### Standardised Names

There are a mix of names, but hyphens and commas for sizes are preferred over brackets.

e.g. *fēnix® 8 - 43 mm, AMOLED*


Links

- Approach S70 - https://www.garmin.com/en-GB/p/847706/
- Descent Mk3 - https://www.garmin.com/en-GB/p/852159/
- epix Pro - https://www.garmin.com/en-GB/p/905283/
- fenix 8 - https://www.garmin.com/en-GB/p/1228493/pn/010-02903-21/
	    

### Shortening Names

Ensure all names under 30 characters, but potentially more bytes in UTF-8.

- Change "Dual Power" to "Solar"
- Remove the suffixes "Edition" and "Collection"
- Remove the suffix "(No Wi-Fi®)"



### Variants

- Asia / China / Japan, etc
- LTE
- No Wi-Fi



### Missing Trademarks

Some product names are missing the registered trademark symbols.

e.g. *ForeAthlete®* and *Montana®*.

To ensure consistency in the output, these scripts fix the missing ® symbols.



### Missing Spaces

Some product names are missing spaces after the trademark symbols.

e.g. *Descent™MK2i* instead of *Descent™ MK2i*.

Some product names are missing spaces before or after hyphens.

e.g. *Descent™ MK3i -51mm* instead of *Descent™ MK3i - 51 mm*.

To ensure consistency in the output, these scripts fix the missing spaces.



### Matching Case

e.g. *Descent™ Mk3 - 43 mm* where the *Mk3* uses camel case.



### Brackets

e.g. *fēnix® 7X Pro (No Wi-Fi®)*



### Split Lines

It can be seen that *Instinct® 3 – 50 mm, Solar, Tactical* is incorrect in the JSON, split into multiple lines.

```json
  {
    "id": "333",
    "partNumber": "006-B4759-00",
    "name": "Instinct® 3 – 50 mm, Solar",
    "additionalNames": [
      "Instinct® 3 – 50 mm",
      "Solar",
      "Tactical"
    ],
    "imageUrl": "https://res.garmin.com/en/products/010-02935-00/v/pd-09-sm.jpg",
    "urlName": "Instinct3-50mm-s"
  },
```

There are a number of watches where this has occurred, but these scripts fix these errors.
