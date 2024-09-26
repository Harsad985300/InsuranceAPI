using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace InsuranceAPI.Models;

public partial class InsurancePolicyContext : DbContext
{
    public InsurancePolicyContext()
    {
    }

    public InsurancePolicyContext(DbContextOptions<InsurancePolicyContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Endorsement> Endorsements { get; set; }

    public virtual DbSet<Policy> Policies { get; set; }

    public virtual DbSet<Submission> Submissions { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS01;Database=Insurance_Policy;TrustServerCertificate=True;User ID=sa;Password=123456");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Endorsement>(entity =>
        {
            entity.HasKey(e => e.EndorsementId).HasName("PK__Endorsem__DBB8330F3467AE7F");

            entity.ToTable("Endorsement");

            entity.Property(e => e.EndorsementId)
                .ValueGeneratedNever()
                .HasColumnName("EndorsementID");
            entity.Property(e => e.EndorsementDetails)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PolicyId).HasColumnName("PolicyID");
        });

        modelBuilder.Entity<Policy>(entity =>
        {
            entity.HasKey(e => e.PolicyId).HasName("PK__Policy__2E1339448A001612");

            entity.ToTable("Policy");

            entity.Property(e => e.PolicyId)
                .ValueGeneratedNever()
                .HasColumnName("PolicyID");
            entity.Property(e => e.PolicyHolderName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PolicyNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Submission>(entity =>
        {
            entity.HasKey(e => e.SubmissionId).HasName("PK__Submissi__449EE105C709B5CD");

            entity.ToTable("Submission");

            entity.Property(e => e.SubmissionId)
                .ValueGeneratedNever()
                .HasColumnName("SubmissionID");
            entity.Property(e => e.PolicyId).HasColumnName("PolicyID");
            entity.Property(e => e.SubmissionStatus)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
