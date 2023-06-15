//
//  APIMock.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

class APIMock: APIProtocol {
    func fetchUsers(pagination: Int, completion: @escaping (Result<[User], APIError>) -> Void) {
        let jsonString = """
        [
          {
            "login": "mojombo",
            "id": 1,
            "node_id": "MDQ6VXNlcjE=",
            "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/mojombo",
            "html_url": "https://github.com/mojombo",
            "followers_url": "https://api.github.com/users/mojombo/followers",
            "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
            "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
            "organizations_url": "https://api.github.com/users/mojombo/orgs",
            "repos_url": "https://api.github.com/users/mojombo/repos",
            "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
            "received_events_url": "https://api.github.com/users/mojombo/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "defunkt",
            "id": 2,
            "node_id": "MDQ6VXNlcjI=",
            "avatar_url": "https://avatars.githubusercontent.com/u/2?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/defunkt",
            "html_url": "https://github.com/defunkt",
            "followers_url": "https://api.github.com/users/defunkt/followers",
            "following_url": "https://api.github.com/users/defunkt/following{/other_user}",
            "gists_url": "https://api.github.com/users/defunkt/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/defunkt/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/defunkt/subscriptions",
            "organizations_url": "https://api.github.com/users/defunkt/orgs",
            "repos_url": "https://api.github.com/users/defunkt/repos",
            "events_url": "https://api.github.com/users/defunkt/events{/privacy}",
            "received_events_url": "https://api.github.com/users/defunkt/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "pjhyett",
            "id": 3,
            "node_id": "MDQ6VXNlcjM=",
            "avatar_url": "https://avatars.githubusercontent.com/u/3?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/pjhyett",
            "html_url": "https://github.com/pjhyett",
            "followers_url": "https://api.github.com/users/pjhyett/followers",
            "following_url": "https://api.github.com/users/pjhyett/following{/other_user}",
            "gists_url": "https://api.github.com/users/pjhyett/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/pjhyett/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/pjhyett/subscriptions",
            "organizations_url": "https://api.github.com/users/pjhyett/orgs",
            "repos_url": "https://api.github.com/users/pjhyett/repos",
            "events_url": "https://api.github.com/users/pjhyett/events{/privacy}",
            "received_events_url": "https://api.github.com/users/pjhyett/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "wycats",
            "id": 4,
            "node_id": "MDQ6VXNlcjQ=",
            "avatar_url": "https://avatars.githubusercontent.com/u/4?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/wycats",
            "html_url": "https://github.com/wycats",
            "followers_url": "https://api.github.com/users/wycats/followers",
            "following_url": "https://api.github.com/users/wycats/following{/other_user}",
            "gists_url": "https://api.github.com/users/wycats/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/wycats/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/wycats/subscriptions",
            "organizations_url": "https://api.github.com/users/wycats/orgs",
            "repos_url": "https://api.github.com/users/wycats/repos",
            "events_url": "https://api.github.com/users/wycats/events{/privacy}",
            "received_events_url": "https://api.github.com/users/wycats/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "ezmobius",
            "id": 5,
            "node_id": "MDQ6VXNlcjU=",
            "avatar_url": "https://avatars.githubusercontent.com/u/5?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ezmobius",
            "html_url": "https://github.com/ezmobius",
            "followers_url": "https://api.github.com/users/ezmobius/followers",
            "following_url": "https://api.github.com/users/ezmobius/following{/other_user}",
            "gists_url": "https://api.github.com/users/ezmobius/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ezmobius/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ezmobius/subscriptions",
            "organizations_url": "https://api.github.com/users/ezmobius/orgs",
            "repos_url": "https://api.github.com/users/ezmobius/repos",
            "events_url": "https://api.github.com/users/ezmobius/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ezmobius/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "ivey",
            "id": 6,
            "node_id": "MDQ6VXNlcjY=",
            "avatar_url": "https://avatars.githubusercontent.com/u/6?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/ivey",
            "html_url": "https://github.com/ivey",
            "followers_url": "https://api.github.com/users/ivey/followers",
            "following_url": "https://api.github.com/users/ivey/following{/other_user}",
            "gists_url": "https://api.github.com/users/ivey/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/ivey/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/ivey/subscriptions",
            "organizations_url": "https://api.github.com/users/ivey/orgs",
            "repos_url": "https://api.github.com/users/ivey/repos",
            "events_url": "https://api.github.com/users/ivey/events{/privacy}",
            "received_events_url": "https://api.github.com/users/ivey/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "evanphx",
            "id": 7,
            "node_id": "MDQ6VXNlcjc=",
            "avatar_url": "https://avatars.githubusercontent.com/u/7?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/evanphx",
            "html_url": "https://github.com/evanphx",
            "followers_url": "https://api.github.com/users/evanphx/followers",
            "following_url": "https://api.github.com/users/evanphx/following{/other_user}",
            "gists_url": "https://api.github.com/users/evanphx/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/evanphx/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/evanphx/subscriptions",
            "organizations_url": "https://api.github.com/users/evanphx/orgs",
            "repos_url": "https://api.github.com/users/evanphx/repos",
            "events_url": "https://api.github.com/users/evanphx/events{/privacy}",
            "received_events_url": "https://api.github.com/users/evanphx/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "vanpelt",
            "id": 17,
            "node_id": "MDQ6VXNlcjE3",
            "avatar_url": "https://avatars.githubusercontent.com/u/17?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/vanpelt",
            "html_url": "https://github.com/vanpelt",
            "followers_url": "https://api.github.com/users/vanpelt/followers",
            "following_url": "https://api.github.com/users/vanpelt/following{/other_user}",
            "gists_url": "https://api.github.com/users/vanpelt/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/vanpelt/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/vanpelt/subscriptions",
            "organizations_url": "https://api.github.com/users/vanpelt/orgs",
            "repos_url": "https://api.github.com/users/vanpelt/repos",
            "events_url": "https://api.github.com/users/vanpelt/events{/privacy}",
            "received_events_url": "https://api.github.com/users/vanpelt/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "wayneeseguin",
            "id": 18,
            "node_id": "MDQ6VXNlcjE4",
            "avatar_url": "https://avatars.githubusercontent.com/u/18?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/wayneeseguin",
            "html_url": "https://github.com/wayneeseguin",
            "followers_url": "https://api.github.com/users/wayneeseguin/followers",
            "following_url": "https://api.github.com/users/wayneeseguin/following{/other_user}",
            "gists_url": "https://api.github.com/users/wayneeseguin/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/wayneeseguin/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/wayneeseguin/subscriptions",
            "organizations_url": "https://api.github.com/users/wayneeseguin/orgs",
            "repos_url": "https://api.github.com/users/wayneeseguin/repos",
            "events_url": "https://api.github.com/users/wayneeseguin/events{/privacy}",
            "received_events_url": "https://api.github.com/users/wayneeseguin/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "brynary",
            "id": 19,
            "node_id": "MDQ6VXNlcjE5",
            "avatar_url": "https://avatars.githubusercontent.com/u/19?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/brynary",
            "html_url": "https://github.com/brynary",
            "followers_url": "https://api.github.com/users/brynary/followers",
            "following_url": "https://api.github.com/users/brynary/following{/other_user}",
            "gists_url": "https://api.github.com/users/brynary/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/brynary/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/brynary/subscriptions",
            "organizations_url": "https://api.github.com/users/brynary/orgs",
            "repos_url": "https://api.github.com/users/brynary/repos",
            "events_url": "https://api.github.com/users/brynary/events{/privacy}",
            "received_events_url": "https://api.github.com/users/brynary/received_events",
            "type": "User",
            "site_admin": false
          }
        ]
        """
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do {
                let users = try decoder.decode([User].self, from: jsonData)
                // Use o objeto "person" que foi criado a partir do JSON
                completion(.success(users))
            } catch {
                let err = APIError.jsonError
                completion(.failure(err))
            }
        } else {
            let err = APIError.jsonError
            completion(.failure(err))
        }
    }
    
    func fetchUserDetail(login: String, completion: @escaping (Result<User, APIError>) -> Void) {
        let jsonString = """
        {
          "login": "Mojambo",
          "id": 13571497,
          "node_id": "MDQ6VXNlcjEzNTcxNDk3",
          "avatar_url": "https://avatars.githubusercontent.com/u/13571497?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/Mojambo",
          "html_url": "https://github.com/Mojambo",
          "followers_url": "https://api.github.com/users/Mojambo/followers",
          "following_url": "https://api.github.com/users/Mojambo/following{/other_user}",
          "gists_url": "https://api.github.com/users/Mojambo/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/Mojambo/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/Mojambo/subscriptions",
          "organizations_url": "https://api.github.com/users/Mojambo/orgs",
          "repos_url": "https://api.github.com/users/Mojambo/repos",
          "events_url": "https://api.github.com/users/Mojambo/events{/privacy}",
          "received_events_url": "https://api.github.com/users/Mojambo/received_events",
          "type": "User",
          "site_admin": false,
          "name": "Daniel Maria Moser",
          "company": "@DieSoftwaregaertnerGmbH ",
          "blog": "",
          "location": null,
          "email": null,
          "hireable": null,
          "bio": null,
          "twitter_username": null,
          "public_repos": 1,
          "public_gists": 0,
          "followers": 1,
          "following": 0,
          "created_at": "2015-07-30T12:23:41Z",
          "updated_at": "2019-03-04T11:38:27Z"
        }
        """
        
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do {
                let user = try decoder.decode(User.self, from: jsonData)
                // Use o objeto "person" que foi criado a partir do JSON
                completion(.success(user))
            } catch {
                let err = APIError.jsonError
                completion(.failure(err))
            }
        } else {
            let err = APIError.jsonError
            completion(.failure(err))
        }
        
    }
    
    func fetchUserRepo(login: String, completion: @escaping (Result<[Repo], APIError>) -> Void) {
        let jsonString = """
        [
          {
            "id": 163880832,
            "node_id": "MDEwOlJlcG9zaXRvcnkxNjM4ODA4MzI=",
            "name": "docker-overpass-api",
            "full_name": "Mojambo/docker-overpass-api",
            "private": false,
            "owner": {
              "login": "Mojambo",
              "id": 13571497,
              "node_id": "MDQ6VXNlcjEzNTcxNDk3",
              "avatar_url": "https://avatars.githubusercontent.com/u/13571497?v=4",
              "gravatar_id": "",
              "url": "https://api.github.com/users/Mojambo",
              "html_url": "https://github.com/Mojambo",
              "followers_url": "https://api.github.com/users/Mojambo/followers",
              "following_url": "https://api.github.com/users/Mojambo/following{/other_user}",
              "gists_url": "https://api.github.com/users/Mojambo/gists{/gist_id}",
              "starred_url": "https://api.github.com/users/Mojambo/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/Mojambo/subscriptions",
              "organizations_url": "https://api.github.com/users/Mojambo/orgs",
              "repos_url": "https://api.github.com/users/Mojambo/repos",
              "events_url": "https://api.github.com/users/Mojambo/events{/privacy}",
              "received_events_url": "https://api.github.com/users/Mojambo/received_events",
              "type": "User",
              "site_admin": false
            },
            "html_url": "https://github.com/Mojambo/docker-overpass-api",
            "description": "A fully working overpass-api docker image: cloning, replication, areas and www interface",
            "fork": true,
            "url": "https://api.github.com/repos/Mojambo/docker-overpass-api",
            "forks_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/forks",
            "keys_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/keys{/key_id}",
            "collaborators_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/collaborators{/collaborator}",
            "teams_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/teams",
            "hooks_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/hooks",
            "issue_events_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/issues/events{/number}",
            "events_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/events",
            "assignees_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/assignees{/user}",
            "branches_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/branches{/branch}",
            "tags_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/tags",
            "blobs_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/git/blobs{/sha}",
            "git_tags_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/git/tags{/sha}",
            "git_refs_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/git/refs{/sha}",
            "trees_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/git/trees{/sha}",
            "statuses_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/statuses/{sha}",
            "languages_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/languages",
            "stargazers_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/stargazers",
            "contributors_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/contributors",
            "subscribers_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/subscribers",
            "subscription_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/subscription",
            "commits_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/commits{/sha}",
            "git_commits_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/git/commits{/sha}",
            "comments_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/comments{/number}",
            "issue_comment_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/issues/comments{/number}",
            "contents_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/contents/{+path}",
            "compare_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/compare/{base}...{head}",
            "merges_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/merges",
            "archive_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/{archive_format}{/ref}",
            "downloads_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/downloads",
            "issues_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/issues{/number}",
            "pulls_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/pulls{/number}",
            "milestones_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/milestones{/number}",
            "notifications_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/notifications{?since,all,participating}",
            "labels_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/labels{/name}",
            "releases_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/releases{/id}",
            "deployments_url": "https://api.github.com/repos/Mojambo/docker-overpass-api/deployments",
            "created_at": "2019-01-02T19:26:14Z",
            "updated_at": "2019-01-02T19:26:15Z",
            "pushed_at": "2017-11-12T18:15:21Z",
            "git_url": "git://github.com/Mojambo/docker-overpass-api.git",
            "ssh_url": "git@github.com:Mojambo/docker-overpass-api.git",
            "clone_url": "https://github.com/Mojambo/docker-overpass-api.git",
            "svn_url": "https://github.com/Mojambo/docker-overpass-api",
            "homepage": null,
            "size": 18,
            "stargazers_count": 0,
            "watchers_count": 0,
            "language": "Shell",
            "has_issues": false,
            "has_projects": true,
            "has_downloads": true,
            "has_wiki": true,
            "has_pages": false,
            "has_discussions": false,
            "forks_count": 0,
            "mirror_url": null,
            "archived": false,
            "disabled": false,
            "open_issues_count": 0,
            "license": null,
            "allow_forking": true,
            "is_template": false,
            "web_commit_signoff_required": false,
            "topics": [

            ],
            "visibility": "public",
            "forks": 0,
            "open_issues": 0,
            "watchers": 0,
            "default_branch": "master"
          }
        ]
        """
        
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do {
                let repos = try decoder.decode([Repo].self, from: jsonData)
                // Use o objeto "person" que foi criado a partir do JSON
                completion(.success(repos))
            } catch {
                let err = APIError.jsonError
                completion(.failure(err))
            }
        } else {
            let err = APIError.jsonError
            completion(.failure(err))
        }
    }
}

