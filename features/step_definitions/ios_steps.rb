When(/^I sum the numbers: "([^"]*)" and "([^"]*)"$/) do |x, y|
  on(CalculatorScreen).enter_first_value(x)
  on(CalculatorScreen).enter_second_value(y)
  on(CalculatorScreen).sum
end

Then(/^I should get "([^"]*)" as the result$/) do |z|
  on(CalculatorScreen).get_sum_value.should == z
end

When(/^I move the slider from position "([^"]*)" to position "([^"]*)"$/) do |arg1, arg2|

end