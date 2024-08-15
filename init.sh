while [ "$#" -gt 0 ]; do
  case "$1" in
    --env | -e)
      env="$2"
      shift 2
      ;;
    *)
      echo "Error: Unsupported argument $1"
      exit 1
      ;;
  esac
done

RAILS_ENV=$env DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:reset
RAILS_ENV=$env rails db:seed

if [ $env = "production" ]; then
  sudo systemctl reload nginx
  sudo systemctl start nginx
  unicorn_rails -c config/unicorn.rb -E production -D
elif [ $env = "development" ]; then
  :
fi
