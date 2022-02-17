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
  ggplot(aes(race, total_incarc, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    x = "Race", 
    y = "Mean incarcerations", 
    fill = "Gender",
    title = "Mean Number of incarceration in 2002 by Race and Gender") +
  theme_minimal() +
  scale_fill_economist()

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)