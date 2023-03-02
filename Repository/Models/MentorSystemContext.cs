using System;
using System.Collections.Generic;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace Repository.Models
{
    public partial class MentorSystemContext : DbContext
    {
        public MentorSystemContext()
        {
        }

        public MentorSystemContext(DbContextOptions<MentorSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<ClassInfo> ClassInfos { get; set; }
        public virtual DbSet<MentorCv> MentorCvs { get; set; }
        public virtual DbSet<MentorSkill> MentorSkills { get; set; }
        public virtual DbSet<Rating> Ratings { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<Skill> Skills { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(GetConnectionString(),
                    builder => builder.EnableRetryOnFailure());

            }
        }
        private string GetConnectionString()
        {
            IConfiguration config = new ConfigurationBuilder()
             .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", true, true)
            .Build();
            var strConn = config["ConnectionStrings:MentorSystemDB"];

            return strConn;
        }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.ToTable("Account");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasMaxLength(250)
                    .HasColumnName("address");

                entity.Property(e => e.Dateofbirth)
                    .HasMaxLength(250)
                    .HasColumnName("dateofbirth");

                entity.Property(e => e.Email)
                    .HasMaxLength(250)
                    .HasColumnName("email");

                entity.Property(e => e.Fullname)
                    .HasMaxLength(250)
                    .HasColumnName("fullname");

                entity.Property(e => e.Password)
                    .HasMaxLength(250)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(250)
                    .HasColumnName("phone");

                entity.Property(e => e.Role)
                    .HasMaxLength(250)
                    .HasColumnName("role");

                entity.Property(e => e.Sex)
                    .HasMaxLength(250)
                    .HasColumnName("sex");
            });

            modelBuilder.Entity<Class>(entity =>
            {
                entity.ToTable("Class");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Mentorid).HasColumnName("mentorid");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .HasColumnName("name");

                entity.Property(e => e.Schedule)
                    .HasMaxLength(250)
                    .HasColumnName("schedule");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.Classes)
                    .HasForeignKey(d => d.Mentorid)
                    .HasConstraintName("FK__Class__mentorid__2D27B809");
            });

            modelBuilder.Entity<ClassInfo>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ClassInfo");

                entity.Property(e => e.Classid).HasColumnName("classid");

                entity.Property(e => e.Studentid).HasColumnName("studentid");

                entity.HasOne(d => d.Class)
                    .WithMany()
                    .HasForeignKey(d => d.Classid)
                    .HasConstraintName("FK__ClassInfo__class__2F10007B");

                entity.HasOne(d => d.Student)
                    .WithMany()
                    .HasForeignKey(d => d.Studentid)
                    .HasConstraintName("FK__ClassInfo__stude__300424B4");
            });

            modelBuilder.Entity<MentorCv>(entity =>
            {
                entity.ToTable("MentorCV");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Achievement)
                    .HasMaxLength(250)
                    .HasColumnName("achievement");

                entity.Property(e => e.Introduction)
                    .HasMaxLength(250)
                    .HasColumnName("introduction");

                entity.Property(e => e.Job)
                    .HasMaxLength(250)
                    .HasColumnName("job");

                entity.Property(e => e.Mentorid).HasColumnName("mentorid");

                entity.Property(e => e.Profession)
                    .HasMaxLength(250)
                    .HasColumnName("profession");

                entity.Property(e => e.Service)
                    .HasMaxLength(250)
                    .HasColumnName("service");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.MentorCvs)
                    .HasForeignKey(d => d.Mentorid)
                    .HasConstraintName("FK__MentorCV__mentor__25869641");
            });

            modelBuilder.Entity<MentorSkill>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("MentorSkill");

                entity.Property(e => e.Mentorid).HasColumnName("mentorid");

                entity.Property(e => e.Skillid).HasColumnName("skillid");

                entity.HasOne(d => d.Mentor)
                    .WithMany()
                    .HasForeignKey(d => d.Mentorid)
                    .HasConstraintName("FK__MentorSki__mento__2A4B4B5E");

                entity.HasOne(d => d.Skill)
                    .WithMany()
                    .HasForeignKey(d => d.Skillid)
                    .HasConstraintName("FK__MentorSki__skill__29572725");
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.ToTable("Rating");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Comment)
                    .HasMaxLength(250)
                    .HasColumnName("comment");

                entity.Property(e => e.Mentorid).HasColumnName("mentorid");

                entity.Property(e => e.Rating1).HasColumnName("rating");

                entity.Property(e => e.Studentid).HasColumnName("studentid");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.RatingMentors)
                    .HasForeignKey(d => d.Mentorid)
                    .HasConstraintName("FK__Rating__mentorid__33D4B598");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.RatingStudents)
                    .HasForeignKey(d => d.Studentid)
                    .HasConstraintName("FK__Rating__studenti__32E0915F");
            });

            modelBuilder.Entity<Request>(entity =>
            {
                entity.ToTable("Request");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Classid).HasColumnName("classid");

                entity.Property(e => e.Content)
                    .HasMaxLength(250)
                    .HasColumnName("content");

                entity.Property(e => e.Mentorid).HasColumnName("mentorid");

                entity.Property(e => e.Status)
                    .HasMaxLength(250)
                    .HasColumnName("status");

                entity.Property(e => e.Studentid).HasColumnName("studentid");

                entity.Property(e => e.Title)
                    .HasMaxLength(250)
                    .HasColumnName("title");

                entity.HasOne(d => d.Class)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.Classid)
                    .HasConstraintName("FK__Request__classid__38996AB5");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.RequestMentors)
                    .HasForeignKey(d => d.Mentorid)
                    .HasConstraintName("FK__Request__mentori__37A5467C");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.RequestStudents)
                    .HasForeignKey(d => d.Studentid)
                    .HasConstraintName("FK__Request__student__36B12243");
            });

            modelBuilder.Entity<Skill>(entity =>
            {
                entity.ToTable("Skill");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .HasColumnName("name");

                entity.Property(e => e.Status)
                    .HasMaxLength(250)
                    .HasColumnName("status");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
