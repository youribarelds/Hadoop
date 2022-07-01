orders = LOAD '/user/maria_dev/Assignment2/orders.csv'  USING PigStorage(',') AS
	(orderID:chararray,
    variable_1:chararray,
    variable_2:chararray,
    location:chararray,
    target:chararray,
    variable_3:chararray,
    variable_4:chararray,
    variable_5:chararray,
    variable_6:chararray);

Filtered_list = Filter orders BY target == '"Holland"';
Grouped_list = GROUP Filtered_list BY (location, target);

Amount = FOREACH Grouped_list GENERATE group, COUNT(Filtered_list);                      

Ordered_list = ORDER Amount BY $0 ASC;

DUMP Ordered_list;
