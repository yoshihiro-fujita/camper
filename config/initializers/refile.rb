require "refile/s3"

aws = {
  access_key_id: "AKIAUZ3NQVE7ZWFVKJHS",
  secret_access_key: "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",
  region: "ap-northeast-1",
  bucket: "outdoorusers",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)