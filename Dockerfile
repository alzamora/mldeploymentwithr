FROM r-base
MAINTAINER Boris Alzamora "soyborisalzamora@gmail.com"


COPY . /app
WORKDIR /app

CMD ["echo install.packages(\"packrat\", repos=\"https://cran.rstudio.com\") | R --no-save"]
CMD ["echo packrat::init()| R --no-save"]
CMD ["echo packrat::clean()| R --no-save"]
CMD ["echo packrat::snapshot()| R --no-save"]
CMD ["echo setwd(\"path_to_plumber_file\") | R --no-save"]
CMD ["echo pr <- plumber::plumb(\"/app/plumber.R\")  | R --no-save"]
CMD ["echo pr$run() | R --no-save"]