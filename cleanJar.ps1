$jar = $args[0]
echo "zip -d $jar 'META-INF/*.SF' 'META-INF/*.RSA' 'META-INF/*.DSA'"
zip -d $jar 'META-INF/*.SF' 'META-INF/*.RSA' 'META-INF/*.DSA'