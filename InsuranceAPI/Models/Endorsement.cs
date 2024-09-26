using System;
using System.Collections.Generic;

namespace InsuranceAPI.Models;

public partial class Endorsement
{
    public int EndorsementId { get; set; }

    public int? PolicyId { get; set; }

    public string? EndorsementDetails { get; set; }

    public DateOnly? EndorsementDate { get; set; }
}
