
library(stats,
        here,
        kableExtra,
        rlang,
        ggthemes,
        tidyverse,
        janitor,
        magrittr,
        glue,
        lubridate,
        haven,
        snakecase,
        sandwich,
        lmtest,
        gganimate,
        gapminder,
        stargazer,
        snakecase
)
read_csv(here("data/NLSY97_clean.csv")) %>%
  
  group_by(race, gender) %>%
  summarize(total_incarc = mean(total_incarc)) %>%
  
  pivot_wider(names_from = race, values_from = total_incarc) %>%
  
  rename_with(to_title_case) %>%
  
  kbl(
    caption = "Mean incarcerations in 2002 by Race and Gender",
    booktabs = TRUE,
    format = "latex",
    label = "tab:summarystats"
  ) %>%
  kable_styling(latex_options = c("striped", "HOLD_position")) %>%
  
  write_lines(here("tables/incarcerations_by_racegender.tex"))
