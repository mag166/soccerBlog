require "./models"

User.create(username: "orlandoc", password: "12345", email:"orlando@nycda.com", birthday:Time.now)
User.create(username: "minhalg", password: "12345", email:"mag166@case.edu", birthday:Time.now)

Post.create(title:"Arsenal must clear the rubble of Arsene Wenger's fallen empire", content:"Cold reality is now staring Arsenal in the face. The Wenger era has three games left to run -- Burnley at home, Leicester away and then the long goodbye at Huddersfield -- and the future must now be about the rebuilding job that lies ahead for the club and whomever they appoint to clear the rubble of Wenger's fallen empire.",img_link:"https://www.ghanacrusader.com/wp-content/uploads/2018/04/wenger-out-arsene-wenger-1.jpg", user_id:1)
Post.create(title:"Falcao is a crappy striker", content:"No news here. Falcao is so shitty nobody should ever sign him.", img_link:"http://i.dailymail.co.uk/i/pix/2015/01/12/2499863B00000578-2907273-image-m-7_1421098835338.jpg", user_id:2)
Post.create(title:"Manchester United is the best team", content:"The best team ever. So Good. Unstoppable. What you gonna do when they come for you.", user_id:1)

Post.create(title:"Antonio Conte the anti-Jurgen Klopp as coaching styles collide at Stamford Bridge", content:"There was a time when Liverpool and Chelsea were happy to see themselves as opposites. Rewind to a rivalry that developed rapidly and vitriolically when Rafa Benitez and Jose Mourinho took charge of the two clubs. Traditional force vs. nouveaux riches, northerners vs. southerners, Champions League winners vs. Premier League champions, the two liked to prove they were the antithesis of the other.", user_id:2)
Post.create(title:"Wayne Rooney lost at Everton", content:"As Everton prepare for their final home game of the season, the visit of relegation-threatened Southampton on Saturday, attention will soon turn to next season. For eight players, their first campaign at the club is drawing to a close. Some might not last much longer at Everton.", img_link:"http://e1.365dm.com/17/07/16-9/20/skysports-wayne-rooney-everton-football_4005799.jpg?20170720095152", user_id:2)
