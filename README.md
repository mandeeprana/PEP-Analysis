# PEP-Analysis

The dataset contains attributes on each person’s demographics and banking information in order to determine they will want to obtain the new PEP (Personal Equity Plan).

First, perform the necessary preprocessing steps required for association rule mining, specifically the id field needs to be removed and a number of numeric fields need discretization or otherwise converted to nominal.

Next perform association rule discovery on the preprocessed data. Experiment with different parameters and preprocessing so that you get on the order of 20-30 strong rules, e.g. rules with high lift and confidence which at the same time have relatively good support. Don’t forget to report in details what you have tried.

Finally, set PEP as the right hand side of the rules, and see what rules are generated.

Select the top 5 most “interesting” rules and for each specify the following:
• Support, Confidence and Lift values
• An explanation of the pattern and why you believe it is interesting based on the business objectives of the company.
• Any recommendations based on the discovered rule that might help the company to better understand behavior of its customers or to develop a business opportunity.

Note that the top 5 most interesting rules are most likely not the top 5 in the strong rules. They are rules, that in addition to having high lift and confidence, also provide some non- trivial, actionable knowledge based on underlying business objectives.
