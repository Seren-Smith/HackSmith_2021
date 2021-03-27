# gender split

################################ 50s #####################################
dataset_50s_male <- filter(dataset_50s, Sex == "Male")
dataset_50s_male

dataset_50s_female <- filter(dataset_50s, Sex == "Female")
dataset_50s_female

by_id_50s_male <- dataset_50s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_50s_female <- dataset_50s_female %>% group_by(ID) %>% filter(Count == max(Count))

top_baby_names_50s <- full_join(by_id_50s_male, by_id_50s_female)
top_baby_names_50s <- rename(top_baby_names_50s, ID = ID)

write.csv(by_id_50s_female, "top_female_baby_names_50.csv", row.names = FALSE)
write.csv(by_id_50s_male, "top_male_baby_names_50.csv", row.names = FALSE)

################################ 60s #####################################
dataset_60s_male <- filter(dataset_60s, Sex == "Male")
dataset_60s_male

dataset_60s_female <- filter(dataset_60s, Sex == "Female")
dataset_60s_female

by_id_60s_male <- dataset_60s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_60s_female <- dataset_60s_female %>% group_by(ID) %>% filter(Count == max(Count))
by_id_60s_female <- rename(by_id_60s_female, ID = ID)

top_baby_names_60s <- full_join(by_id_60s_male, by_id_60s_female)

write.csv(by_id_60s_female, "top_female_baby_names_60.csv", row.names = FALSE)
write.csv(by_id_60s_male, "top_male_baby_names_60.csv", row.names = FALSE)

################################ 70s #####################################
dataset_70s_male <- filter(dataset_70s, Sex == "Male")
dataset_70s_male

dataset_70s_female <- filter(dataset_70s, Sex == "Female")
dataset_70s_female

by_id_70s_male <- dataset_70s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_70s_female <- dataset_70s_female %>% group_by(ID) %>% filter(Count == max(Count))

top_baby_names_70s <- full_join(by_id_70s_male, by_id_70s_female)
top_baby_names_70s <- rename(top_baby_names_70s, ID = ID)

write.csv(by_id_70s_female, "top_female_baby_names_70.csv", row.names = FALSE)
write.csv(by_id_70s_male, "top_male_baby_names_70.csv", row.names = FALSE)

################################ 80s #####################################
dataset_80s_male <- filter(dataset_80s, Sex == "Male")
dataset_80s_male

dataset_80s_female <- filter(dataset_80s, Sex == "Female")
dataset_80s_female

by_id_80s_male <- dataset_80s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_80s_female <- dataset_80s_female %>% group_by(ID) %>% filter(Count == max(Count))
by_id_80s_female <- rename(by_id_80s_female, ID = ID)

top_baby_names_80s <- full_join(by_id_80s_male, by_id_80s_female)

write.csv(by_id_80s_female, "top_female_baby_names_80.csv", row.names = FALSE)
write.csv(by_id_80s_male, "top_male_baby_names_80.csv", row.names = FALSE)

################################ 90s #####################################
dataset_90s_male <- filter(dataset_90s, Sex == "Male")
dataset_90s_male

dataset_90s_female <- filter(dataset_90s, Sex == "Female")
dataset_90s_female

by_id_90s_male <- dataset_90s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_90s_female <- dataset_90s_female %>% group_by(ID) %>% filter(Count == max(Count))

top_baby_names_90s <- full_join(by_id_90s_male, by_id_90s_female)
top_baby_names_90s <- rename(top_baby_names_90s, ID = ID)

write.csv(by_id_90s_female, "top_female_baby_names_90.csv", row.names = FALSE)
write.csv(by_id_90s_male, "top_male_baby_names_90.csv", row.names = FALSE)

################################ 00s #####################################
dataset_00s_male <- filter(dataset_00s, Sex == "Male")
dataset_00s_male

dataset_00s_female <- filter(dataset_00s, Sex == "Female")
dataset_00s_female

by_id_00s_male <- dataset_00s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_00s_female <- dataset_00s_female %>% group_by(ID) %>% filter(Count == max(Count))
by_id_00s_female <- rename(by_id_00s_female, ID = ID)

top_baby_names_00s <- full_join(by_id_00s_male, by_id_00s_female)

write.csv(by_id_00s_female, "top_female_baby_names_00.csv", row.names = FALSE)
write.csv(by_id_00s_male, "top_male_baby_names_00.csv", row.names = FALSE)

################################ 10s #####################################
dataset_10s_male <- filter(dataset_10s, Sex == "Male")
dataset_10s_male

dataset_10s_female <- filter(dataset_10s, Sex == "Female")
dataset_10s_female

by_id_10s_male <- dataset_10s_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_10s_female <- dataset_10s_female %>% group_by(ID) %>% filter(Count == max(Count))

top_baby_names_10s <- full_join(by_id_10s_male, by_id_10s_female)
top_baby_names_10s <- rename(top_baby_names_10s, ID = ID)

write.csv(by_id_10s_female, "top_female_baby_names_10.csv", row.names = FALSE)
write.csv(by_id_10s_male, "top_male_baby_names_10.csv", row.names = FALSE)

################################ 15s #####################################
dataset_15_male <- filter(dataset_15, Sex == "Male")
dataset_15_male

dataset_15_female <- filter(dataset_15, Sex == "Female")
dataset_15_female

by_id_15_male <- dataset_15_male %>% group_by(ID) %>% filter(Count == max(Count))

by_id_15_female <- dataset_15_female %>% group_by(ID) %>% filter(Count == max(Count))

top_baby_names_15 <- full_join(by_id_15_male, by_id_15_female)
top_baby_names_15 <- rename(top_baby_names_15, ID = ID)

write.csv(by_id_15_female, "top_female_baby_names_15.csv", row.names = FALSE)
write.csv(by_id_15_male, "top_male_baby_names_15.csv", row.names = FALSE)

