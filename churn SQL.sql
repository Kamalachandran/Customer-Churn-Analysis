-- 1.the gender distribution of customers in the churn
select gender, count(gender) as total,
concat(round(count(gender) * 100.0 / (select count(*) from churn),1),'%') as percentage
from churn
group by gender;

-- 2.customers distributed across different contract types
select contract, count(contract) as total,
concat(round(count(contract) * 100.0 / (select count(*) from churn),1),'%') as percentage
from churn
group by contract;

-- 3.the total revenue and revenue share contributed by each customer status (churned, stayed, joined)
select customer_status, count(customer_status) as total,
format(sum(total_revenue),2) as totalrev,
concat(round(sum(total_revenue) / (select sum(total_revenue) from churn) * 100,1),'%') as revpercentage 
from churn 
group by customer_status;

-- 4.State-wise Customer Distribution
select state, count(state) as totalcount,
concat(round(count(state) * 100.0 / (select count(*) from churn),1),'%') as percentage
from churn
group by state
order by percentage desc;

-- 5. age group distribution
select 
  case 
    when age < 30 then 'under 30'
    when age between 30 and 45 then '30-45'
    when age between 46 and 60 then '46-60'
    else '60+' 
  end as age_group,
  count(*) as total,
  concat(round(count(*) * 100.0 / (select count(*) from churn), 1), '%') as percentage
from churn
group by age_group
order by case 
    when age_group = 'under 30' then 1
    when age_group = '30-45' then 2
    when age_group = '46-60' then 3
    when age_group = '60+' then 4
  end;

-- 6. internet type preference
select internet_type, count(*) as total,
concat(round(count(*) * 100.0 / (select count(*) from churn), 1), '%') as percentage
from churn
group by internet_type;

-- 7. refund analysis by customer status
select customer_status,
format(sum(total_refunds), 2) as total_refunds,
concat(round(sum(total_refunds) * 100.0 / (select sum(total_refunds) from churn), 1), '%') as refund_share
from churn
group by customer_status;

-- 8. unlimited data vs churn
select 
  customer_status,
  sum(case when unlimited_data = 'yes' then 1 else 0 end) as unlimited_data,
  sum(case when unlimited_data = 'no' then 1 else 0 end) as no_unlimited_data
from churn
group by customer_status;


-- 9. phone service and churn category
select  churn_category,
sum(case when phone_service = 'yes' then 1 else 0 end) as phone_service,
sum(case when phone_service = 'no' then 1 else 0 end) as no_phone_service
from churn
where customer_status = 'churned'
group by churn_category;

-- 10. payment method distribution by customer status with total customers and revenve
select 
  payment_method,
  sum(case when customer_status = 'churned' then 1 else 0 end) as churned,
  sum(case when customer_status = 'stayed' then 1 else 0 end) as stayed,
  sum(case when customer_status = 'joined' then 1 else 0 end) as joined,
  format(count(customer_id), 0) as total_customers,
  format(sum(total_revenue), 2) as total_revenue
from churn
group by payment_method;

-- create view
create view churned as
    select * from churn where customer_status = 'churned';

create view joined as
    select * from churn where customer_status = 'joined';
    
create view stayed as
    select * from churn where customer_status = 'stayed';
