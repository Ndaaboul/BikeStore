# Bike Store Sales and Inventory Insights Dashboard



## Problem Statement

The bike store seeks to enhance its operational efficiency and sales performance by gaining comprehensive insights into customer demographics, sales trends, product performance, and inventory management. Despite having a wealth of data, the store struggles to consolidate and analyze this information effectively, leading to missed opportunities for optimizing stock levels, identifying top-performing products, and improving staff productivity. This project aims to develop a robust Power BI dashboard that integrates and visualizes data from various aspects of the business, enabling data-driven decision-making to drive sales growth and streamline inventory management.


### Steps followed 

- Step 1 : Data was sourced from Kaggle.com.
- Step 2 : Excel was utilized to clean and preprocess the raw data.
- Step 3 : The data was imported into SSMS, where new tables were created using queries. This process aimed to establish a more streamlined and efficient dataset for building a Power BI dashboard.
- Step 4 : The new tables created using queries in SSMS have now been imported into Power BI.


- Step 5 : The Model View in Power BI was utilized to establish relationships between the imported tables. This process is illustrated in the picture below.

![ModelView](https://github.com/Ndaaboul/BikeStore/assets/123441867/3d64deaa-0dbe-4fd2-9c1b-be507f44cbe0)

- Step 6 : multi-row card visualization was created to display the total sales for each store, providing a clear and concise overview of store performance.

![card](https://github.com/Ndaaboul/BikeStore/assets/123441867/299f79a0-8ea7-435a-8b07-f772ddeb7a4a)


- Step 7 :To enhance the interactivity and usability of the dashboard, two slicers were added. One slicer filters the data by store names, allowing users to focus on specific stores, while the other slicer filters the data by year, enabling users to analyze trends and performance over different time periods. These slicers facilitate a more dynamic and customized data exploration experience.

![Slicer](https://github.com/Ndaaboul/BikeStore/assets/123441867/8a7543d1-0b8f-45cf-a96f-fd6b3ceecab9)


- Step 8 : Stacked area chart was created in Power BI using the count of customers by state. This visualization provides a clear representation of the customer distribution across different states, showing how the number of customers varies regionally. By stacking the areas for each state, it becomes easy to compare and understand the relative customer base size in each state, highlighting trends and regional differences in customer distribution.

![CustomersByState](https://github.com/Ndaaboul/BikeStore/assets/123441867/51fc3f03-3802-40f3-a010-84dead3ffc08)


- Step 9 : A line and stacked column chart was crafted in Power BI with the first name on the x-axis, representing individual customers. Total spending was plotted on the first y-axis to generate the stacked columns, illustrating the amount each customer spent. Additionally, the number of orders was plotted on the second y-axis, creating a line graph that depicts the number of orders placed by each customer. This combined visualization allows for a comprehensive analysis of both spending behavior and order frequency for individual customers.

![SpendingByCustomer](https://github.com/Ndaaboul/BikeStore/assets/123441867/ec22e242-523c-4fb6-a2dd-97b85fe0d7a7)


- Step 10 : A line and stacked column chart was constructed in Power BI to exhibit staff performance. The x-axis features the names of staff members, providing a clear identification of each individual. The first y-axis displays sales performance, showcasing the total sales achieved by each staff member through stacked columns. Simultaneously, the second y-axis represents the number of orders handled by each staff member, depicted as a line graph. This visualization enables a comprehensive evaluation of staff performance in terms of both sales achievement and order management.

![StaffPerformance](https://github.com/Ndaaboul/BikeStore/assets/123441867/0b6edc58-82bd-4689-98c6-3b0771742e70)


- Step 11 : A stacked column chart was generated in Power BI to visualize the monthly total sales. The x-axis represents the months of the year, providing a chronological view. Meanwhile, the y-axis illustrates the total sales for each month. By stacking the columns, the chart effectively displays the contribution of sales from different months to the overall revenue, allowing for easy comparison of sales performance across different time periods.

![Monthly Sales](https://github.com/Ndaaboul/BikeStore/assets/123441867/64ada71b-e310-4962-a498-96f44855ac16)


- Step 12 : A line and stacked column chart was produced in Power BI to visualize the sales by product and the available stock for each product. The x-axis features the names of products, providing clarity on product identification. The first y-axis illustrates sales performance through stacked columns, showing the total sales achieved for each product. Simultaneously, the second y-axis represents the available stock for each product, depicted as a line graph. This combined visualization facilitates a comprehensive analysis of product performance, showcasing both sales trends and inventory levels for informed decision-making.

![SalesByProduct](https://github.com/Ndaaboul/BikeStore/assets/123441867/b4ad2f68-8576-4689-8efc-8e894c72cd66)

VIEW OF THE FULL DASHBOARD:

![DashBoard](https://github.com/Ndaaboul/BikeStore/assets/123441867/f8aac90f-e8b8-40ae-96bb-6f157745be4c)


