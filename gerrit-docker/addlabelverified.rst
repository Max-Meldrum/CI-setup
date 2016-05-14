mkdir tmp
cd tmp
git init
git remote add origin ssh://maxm@192.168.0.201:29418/All-Projects
git fetch origin refs/meta/config:refs/remotes/origin/meta/config
git checkout meta/config

# Add to bottom of project.config

[label "Verified"]
    function = MaxWithBlock
    value = -1 Fails
    value =  0 No score
    value = +1 Verified

git commit -am "label verified added"
git push origin meta/config:meta/config
