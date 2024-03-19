# TaxStax

TaxStax is a solution to collect and analyze your sales tax from receipts (e.g. shopping, restaurants, etc.)

# Generate mermaid diagram
```mermaid
graph LR;
    A[Mobile App] --> B{Capture Receipt Image}
    B --> |Optional| C{Image Preprocessing}
    B --> D{OCR Engine}
    D --> E{Data Processing & Parsing}
    E --> F{"Data Enrichment (Optional)"}
    F --> G{Mobile App / Frontend UI}
    E --> G
    G --> H{User Edits & Additional Info}
    G --> I{Data Storage}
    I --> |"Analysis & Reporting (Optional)"| J{Analysis Service}
    J --> K{"Reports (Mobile App/Web)"}
````