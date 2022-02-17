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

model <- 
  read_csv(here("data/NLSY97_clean.csv")) %>%
  lm(total_incarc ~ race + gender, data = .)


se <- model %>% vcovHC %>% diag %>% sqrt


covariate.labels <- names(coef(model))[-1] %>% str_replace("(^race)|(^gender)", "")

stargazer(
  model,
  se = list(se),
  covariate.labels = covariate.labels,
  dep.var.labels = "incarcerations in 2002",
  out = here("tables/regress_incarcerations_by_racegender.tex"),
  title = "Regression Output. Omitted category is Black Females.",
  label = "tab:regression"
)

