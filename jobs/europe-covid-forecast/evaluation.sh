# update evaluation website
docker exec -w /home/rstudio/europe-covid-forecast forecast bash reports/update-website.sh

# update github 
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated evaluation update' ; git pull -Xours; git push"
