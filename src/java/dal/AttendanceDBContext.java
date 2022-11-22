/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.User;
import model.Class;
import model.Schedule;
import model.Slot;

/**
 *
 * @author ACER
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public void takeAttendances(ArrayList<Attendance> attendances, User u) {
        try {
            connection.setAutoCommit(false);
            for (Attendance attendance : attendances) {
                String sql = "INSERT INTO `swp391`.`attendance`\n"
                        + "(`class_id`,\n"
                        + "`trainee_id`,\n"
                        + "`schedule_id`,\n"
                        + "`status`,\n"
                        + "`comment`,\n"
                        + "`created_by`,\n"
                        + "`created_at`)\n"
                        + "VALUES\n"
                        + "(?,?,?,?,?,?,NOW());";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, attendance.getClass_id().getClass_id());
                stm.setInt(2, attendance.getTrainee_id().getId());
                stm.setInt(3, attendance.getSchedule_id().getSchedule_id());
                stm.setBoolean(4, attendance.getStatus());
                stm.setString(5, attendance.getComment());
                stm.setInt(6, u.getId());
                stm.executeUpdate();
            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Attendance> listAttendanceInASchedule(int schedule_id) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT a.class_id,t.user_id,t.full_name,t.email,s.schedule_id,a.status,a.comment FROM \n"
                    + "swp391.attendance a JOIN swp391.schedule s ON a.schedule_id = s.schedule_id\n"
                    + "JOIN swp391.user t ON t.user_id = a.trainee_id\n"
                    + "Where s.schedule_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, schedule_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Class c = new Class();
                c.setClass_id(rs.getInt(rs.getInt("class_id")));
                a.setClass_id(c);
                User trainee = new User();
                trainee.setId(rs.getInt("user_id"));
                trainee.setFullname(rs.getString("full_name"));
                trainee.setEmail(rs.getString("email"));
                a.setTrainee_id(trainee);
                Schedule s = new Schedule();
                s.setSchedule_id(schedule_id);
                a.setSchedule_id(s);
                a.setStatus(rs.getBoolean("status"));
                a.setComment(rs.getString("comment"));
                attendances.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public void updateAttendances(ArrayList<Attendance> attendances, User u) {
        try {
            connection.setAutoCommit(false);
            for (Attendance a : attendances) {
                String sql = "UPDATE `swp391`.`attendance`\n"
                        + "SET ";

                int count = 0;

                HashMap<Integer, Object> params = new HashMap<>();

                if (a.getStatus() != null) {
                    count++;
                    sql += "status = ?,\n";
                    params.put(count, a.getStatus());
                }

                if (a.getComment() != null) {
                    count++;
                    sql += "comment = ?,\n";
                    params.put(count, a.getComment());
                }

                //sql = sql.substring(0, sql.length() - 2);
                sql += "modified_by = " + u.getId() + ", ";
                sql += "modified_at = NOW() ";
                sql += "WHERE `class_id` = ? AND `trainee_id` = ? AND `schedule_id` = ?;";

                PreparedStatement stm = connection.prepareStatement(sql);

                for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                    Integer key = entry.getKey();
                    Object val = entry.getValue();
                    stm.setObject(key, val);
                }

                count++;
                stm.setInt(count, a.getClass_id().getClass_id());
                count++;
                stm.setInt(count, a.getTrainee_id().getId());
                count++;
                stm.setInt(count, a.getSchedule_id().getSchedule_id());

                stm.executeUpdate();
            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Attendance> listAttendanceInAClass(int classID) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT class_id,trainee_id,schedule_id,status,comment FROM swp391.attendance\n"
                    + "Where class_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, classID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                User t = new User();
                t.setId(rs.getInt("trainee_id"));
                a.setTrainee_id(t);
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));
                a.setSchedule_id(s);
                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                a.setClass_id(c);
                a.setStatus(rs.getBoolean("Status"));
                a.setComment(rs.getString("Comment"));
                attendances.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public ArrayList<Attendance> listByTrainee(int traineeId, int class_id, Boolean status, int pageIndex, int pageSize) {
        ArrayList<Attendance> list = new ArrayList<>();
        try {
            String sql = "SELECT a.class_id, c.class_code, a.schedule_id, s.slot_id,\n"
                    + "s.training_date, a.status, a.comment FROM swp391.attendance a\n"
                    + "JOIN swp391.class c ON a.class_id = c.class_id\n"
                    + "JOIN swp391.schedule s ON a.schedule_id = s.schedule_id\n"
                    + "WHERE trainee_id = ?\n";
            if (status != null) {
                sql += "AND a.status = " + status + " \n";
            }
            if (class_id != 0)
                sql += "AND a.class_id = " + class_id + " \n";
            sql += "LIMIT ?, ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, traineeId);
            stmt.setInt(2, pageSize * (pageIndex - 1));
            stmt.setInt(3, pageSize);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();

                Class classroom = new Class();
                classroom.setClass_id(rs.getInt("class_id"));
                classroom.setClass_code(rs.getString("class_code"));
                a.setClass_id(classroom);

                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));
                SlotDBContext sldbc = new SlotDBContext();
                Slot sl = sldbc.get(rs.getInt("slot_id"));
                s.setSlot(sl);
                s.setTraining_date(rs.getDate("training_date"));
                a.setSchedule_id(s);

                a.setStatus(rs.getBoolean("status"));
                a.setComment(rs.getString("comment"));

                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public int listByTraineeCount(int traineeId, int class_id, Boolean status) {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) AS 'total' FROM swp391.attendance a\n"
                    + "JOIN swp391.class c ON a.class_id = c.class_id\n"
                    + "JOIN swp391.schedule s ON a.schedule_id = s.schedule_id\n"
                    + "WHERE trainee_id = ?\n";
            if (status != null) {
                sql += "AND a.status = " + status + " \n";
            }
            if (class_id != 0)
                sql += "AND a.class_id = " + class_id + " \n";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, traineeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
            
        } catch (Exception e) {
        }
        return total;
    }

    public boolean isTaken(int schedule_id) {
        boolean isTaken = false;
        try {
            String sql = "SELECT COUNT(*) AS `total` FROM swp391.attendance\n"
                    + "WHERE schedule_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, schedule_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("total");
                if (total > 0) {
                    isTaken = true;
                }
            }
        } catch (SQLException e) {
        }
        return isTaken;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
