trigger Basic_Trigger on Opportunity (Before insert, Before update) {
for (Opportunity a : Trigger.new){
if (a.Amount < 100)
a.adderror('Amount value should be greater than 100');

}


}