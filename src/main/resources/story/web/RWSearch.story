Description: Simple story to test pass.rw.by search is working;

Scenario: Open rw.by search main page
Given I am on the main application page
When I enter `Minsk` in field located `By.Id(one-way-raspFormFromTitle)`
When I enter `Maladziečna` in field located `By.Id(one-way-raspFormToTitle)`
When I click on element located `By.xpath(//div[@id="filter-tab_2-1"]//*[@data-date="everyday"])`
When I click on element located `By.xpath(//div[@class='collapse in']//div[@class='tab-pane fade in active']//button[@class='btn btn-default btn-submit js-input-taber'])`
Then the page title is equal to 'Schedule and search for tickets'
Then number of elements found by `By.className(sch-links__link)` is equal to `4`
When I set the number of elements found `By.xpath(//div[contains(@class, "sch-table__row-wrap")])` to STORY variable `numberOfTrains`

Scenario: Verify filters on Search Results page

When I CHECK checkbox located by `By.xpath(//span[@data-filter-value="w_places"])`
When I set the number of elements found `By.xpath(//div[contains(@class, "sch-table__row-wrap") and contains(@class, "hidden")])` to STORY variable `numberOfHiddenTrains`
Then number of elements found by `By.xpath(//div[contains(@class, "sch-table__row-wrap") and not(contains(@class, "hidden"))])` is equal to `<displayedTrains>`
Examples:
|displayedTrains|
|${numberOfTrains} - ${numberOfHiddenTrains}|
