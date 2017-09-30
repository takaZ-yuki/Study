using System;
using System.Collections.Generic;
using System.Linq;
using web_app.DAL;
using web_app.DbConnection;
using web_app.Models;
using web_app.Service.Abstractions;

namespace web_app.Service
{
    /// <summary>
    /// DI用サンプルクラス
    /// </summary>
    public class HelloService : BaseSarvice, IHelloService
    {
        // コンテキスト
        private readonly WevAppDbContext context;

        // memberリポジトリ
        private readonly MemberRepository memberRepository;
        // todoリポジトリ
        private readonly TodoRepository todoRepository;

        public HelloService(WevAppDbContext _context)
        {
            // インジェクション
            context = _context;
            memberRepository = new MemberRepository(_context);
            todoRepository = new TodoRepository(_context);
        }

        /// <summary>
        /// サンプル関数
        /// </summary>
        /// <returns></returns>
        public string Hi()
        {

            // memmberを追加する
            var members = new List<Member>
                {
                    new Member { Id = "AAAAA", Name = "AAAAA" },
                    new Member { Id = "BBBBB", Name = "BBBBB" },
                };

            foreach (Member m in members)
            {
                memberRepository.Add(m);
            }


            // todoを追加する
            var todos = new List<Todo>
                {
                    new Todo { Member = members[0], Content = "content1", Due = DateTime.Now, Done = false },
                    new Todo { Member = members[0], Content = "content2", Due = DateTime.Now, Done = false },
                    new Todo { Member = members[1], Content = "content3", Due = DateTime.Now, Done = false },
                };

            foreach (Todo m in todos)
            {
                todoRepository.Add(m);
            }

            _logger.Debug("---------------------------------------------------");
            foreach (var x in memberRepository.GetAll())
            {
                _logger.Debug(x.Id);
                _logger.Debug(x.Name);
                foreach(var y in x.Todos)
                {
                    _logger.Debug(y.Id);
                    _logger.Debug(y.MemberId);
                    _logger.Debug(y.Content);
                    _logger.Debug(y.Due);
                    _logger.Debug(y.Done);
                }
            }

            _logger.Debug("---------------------------------------------------");
            foreach (var y in todoRepository.GetAll())
            {
                _logger.Debug(y.Id);
                _logger.Debug(y.MemberId);
                _logger.Debug(y.Content);
                _logger.Debug(y.Due);
                _logger.Debug(y.Done);
            }


            return "(^o^)";
        }
    }
}
